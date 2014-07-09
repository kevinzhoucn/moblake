class CreateHomeTasks < ActiveRecord::Migration
  def change
    create_table :home_tasks do |t|
      t.string :title
      t.string :description
      t.integer :task_type

      t.timestamps
    end
  end
end
