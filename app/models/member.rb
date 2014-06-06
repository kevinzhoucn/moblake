class Member < ActiveRecord::Base
  attr_accessible :name, :alipay, :credit, :last_order_id, :last_order_type, :phone, :points
  has_many :exchange_id
end
