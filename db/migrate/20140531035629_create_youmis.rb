class CreateYoumis < ActiveRecord::Migration
  def change
    create_table :youmis do |t|
      t.string :order, :length => 16
      t.string :app, :length => 16
      t.string :ad, :length => 50
      t.integer :adid
      t.string :user
      t.string :device
      t.integer :chn
      t.float :price
      t.integer :points
      t.integer :time
      t.string :sig, :length => 8
      t.string :sign, :length => 36
      t.string :source

      t.timestamps
    end
  end
end
