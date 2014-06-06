class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :reviewed, :default => false
      t.string :member_name, :default => "default"
      t.integer :points, :default => 0
      t.integer :admin_id

      t.timestamps
    end
  end
end
