class CreateYoumis < ActiveRecord::Migration
  def change
    create_table :youmis do |t|
      t.string :order, :limit => 16
      t.string :app, :limit => 16
      t.string :ad, :limit => 50
      t.integer :adid
      t.string :user
      t.string :device
      t.integer :chn
      t.float :price
      t.integer :points
      t.integer :time
      t.string :sig, :limit => 8
      t.string :sign, :limit => 36
      t.string :source

      t.timestamps
    end
  end
end
