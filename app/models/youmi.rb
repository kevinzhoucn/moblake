class Youmi < ActiveRecord::Base
  attr_accessible :ad, :adid, :app, :chn, :devise, :order, :points, :price, :sig, :sign, :source, :time, :user

  before_save do |youmi|
    WORKER_LOG.info "Will create new point from Youmi #{youmi.order}, #{youmi.app}, #{youmi.adid}!"
  end
  
  after_save :create_task

  protected
    def create_task
      WORKER_LOG.info "New point for Youmi ID: #{self.id}!"

      task = Task.new
      task.order_id = self.id
      task.order_type = 1
      task.member_name = self.user
      task.points = self.points

      if task.save
        WORKER_LOG.info "Create new task ID: #{task.id}, Order ID: #{task.order_id}, Order Type: #{task.order_type}!"
      end
    end
end
