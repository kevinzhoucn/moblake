class Exchange < ActiveRecord::Base
  attr_accessible :points, :type, :member_id
  belongs_to :member
end
