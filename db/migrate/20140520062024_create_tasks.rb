class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :reviewed, :default => false
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
