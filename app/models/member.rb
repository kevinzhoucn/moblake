class Member < ActiveRecord::Base
  attr_accessible :name, :alipay, :available_points, :last_order_id, :last_order_type, :phone, :total_points
  has_many :exchange_id

#  after_save :gen_name

  private
    def gen_name
      tname = 10000 + self.id
      self.name = tname.to_s
    end
end
