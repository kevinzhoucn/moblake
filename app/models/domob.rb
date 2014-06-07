class Domob < ActiveRecord::Base
  attr_accessible :ad, :adid, :channel, :device, :orderid, :point, :price, :pubid, :sign, :ts, :user

  before_save do |domob|
    WORKER_LOG.info "Will create new point from Youmi #{domob.orderid}, #{domob.pubid}, #{domob.adid}!"
  end
  
  after_save :create_task

  protected
    def create_task
      WORKER_LOG.info "New point for Domob ID: #{self.id}!"

      task = Task.new
      task.order_id = self.id
      task.order_type = 2
      task.member_name = self.user
      task.points = self.point

      if task.save
        WORKER_LOG.info "Create new task ID: #{task.id}, Order ID: #{task.order_id}, Order Type: #{task.order_type}!"
      end
    end
end
