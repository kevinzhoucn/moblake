class Task < ActiveRecord::Base
  # order_type: [0, 'checkin'], [1, 'duomi'], [2, 'duomeng'], [3, 'tengxun']
  attr_accessible :admin_id, :description, :name, :reviewed, :member_id, :member_name, :order_id, :order_type, :points, :reviewed_type
  belongs_to :admin

  scope :has_reviewed, where(:reviewed => true)
  scope :pending_reviewed, where(:reviewed => false)

  after_save :set_member_points

  def get_app_name
    order = get_task_order
    if order
      order.ad
    else
      "None"
    end
  end

  protected
    def get_task_order
      if self.order_type
        order_type = self.order_type
        if order_type == 1
          order = Youmi.find(self.order_id)
        elsif order_type == 2
          order = Domob.find(self.order_id)
        end
      end
    end

    def set_member_points
      # member_name = self.member_name
      # member = Member.find_by_name(member_name)
      member_id = self.member_name
      member = Member.find(member_id)
      if member
        WORKER_LOG.info "Existed member Name: #{member_name}!"
        old_total_points = member.total_points
        new_total_points = member.total_points + self.points
        old_available_points = member.available_points
        new_available_points = member.available_points + self.points
        new_last_order_id = self.order_id
        new_last_order_type = self.order_type

        if member.update_attributes(:total_points => new_total_points, :available_points => new_available_points, :last_order_id => new_last_order_id, :last_order_type => new_last_order_type )
          WORKER_LOG.info "Update member total_points succeed! ID: #{member.id}, Name: #{member_name}, Old total_points: #{old_total_points}, New total_points: #{new_total_points}, Old available_points: #{old_available_points}, New available_points: #{new_available_points}!"
        end
      # else
      #   member = Member.new
      #   member.name = member_name
      #   member.total_points = self.points
      #   member.credit = self.points
      #   member.last_order_id = self.order_id
      #   member.last_order_type = self.order_type

      #   if member.save
      #     WORKER_LOG.info "Create member succeed! ID: #{member.id}, Name: #{member_name}!"
      #   else
      #     WORKER_LOG.info "Create member failed! Name: #{member_name}!"
      #   end
      end
    end
end
