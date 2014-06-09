class AddDeviceIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :device_id, :string
  end
end
