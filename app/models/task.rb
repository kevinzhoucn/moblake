class Task < ActiveRecord::Base
  # order_type: [1, 'duomi'], [2, 'duomeng'], [3, 'tengxun']
  attr_accessible :admin_id, :description, :name, :reviewed, :member_id, :member_name, :order_id, :order_type, :points
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
      member_name = self.member_name
      member = Member.find_by_name(member_name)
      if member
        WORKER_LOG.info "Existed member Name: #{member_name}!"
        old_points = member.points
        new_points = member.points + self.points
        old_credit = member.credit
        new_credit = member.credit + self.points
        new_last_order_id = self.order_id
        new_last_order_type = self.order_type

        if member.update_attributes(:points => new_points, :credit => new_credit, :last_order_id => new_last_order_id, :last_order_type => new_last_order_type )
          WORKER_LOG.info "Update member points succeed! ID: #{member.id}, Name: #{member_name}, Old points: #{old_points}, New points: #{new_points}, Old credit: #{old_credit}, New credit: #{new_credit}!"
        end
      else
        member = Member.new
        member.name = member_name
        member.points = self.points
        member.credit = self.points
        member.last_order_id = self.order_id
        member.last_order_type = self.order_type

        if member.save
          WORKER_LOG.info "Create member succeed! ID: #{member.id}, Name: #{member_name}!"
        else
          WORKER_LOG.info "Create member failed! Name: #{member_name}!"
        end
      end
    end
end
