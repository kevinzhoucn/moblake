class HomeTask < ActiveRecord::Base
  attr_accessible :description, :title, :task_type, :published
end
