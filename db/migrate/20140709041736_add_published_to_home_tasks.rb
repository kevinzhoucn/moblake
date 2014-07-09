class AddPublishedToHomeTasks < ActiveRecord::Migration
  def change
    add_column :home_tasks, :published, :boolean, :default => false
  end
end
