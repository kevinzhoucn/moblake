class CreateYoumis < ActiveRecord::Migration
  def change
    create_table :youmis do |t|
      t.string :order
      t.string :app
      t.string :ad
      t.integer :adid
      t.string :user
      t.string :device
      t.integer :chn
      t.float :price
      t.integer :points
      t.integer :time
      t.string :sig
      t.string :sign
      t.string :source

      t.timestamps
    end
  end
end
