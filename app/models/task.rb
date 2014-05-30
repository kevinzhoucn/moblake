class Task < ActiveRecord::Base
  attr_accessible :admin_id, :description, :name, :reviewed, :user_id
  belongs_to :admin

  scope :has_reviewed, where(:reviewed => true)
  scope :pending_reviewed, where(:reviewed => false)
end
