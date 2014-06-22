class AddMemberIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :member_id, :integer
  end
end
