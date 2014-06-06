class AddOrderIdOrderTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :order_id, :integer
    add_column :tasks, :order_type, :integer
  end
end
