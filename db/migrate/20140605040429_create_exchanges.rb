class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :points
      t.integer :member_id
      t.integer :type

      t.timestamps
    end
  end
end
