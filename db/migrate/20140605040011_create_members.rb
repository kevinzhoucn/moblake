class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, :length => 40, :default => "default"
      t.integer :total_points, :default => 0
      t.integer :available_points, :default => 0
      t.string :phone, :default => "xxxxxxx", :length => 16
      t.string :alipay, :default => "xxxxxxx", :length => 30
      t.integer :last_order_id
      t.integer :last_order_type

      t.timestamps
    end
  end
end
