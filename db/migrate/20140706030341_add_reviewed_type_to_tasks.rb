class AddReviewedTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :reviewed_type, :integer, :default => 0
  end
end
