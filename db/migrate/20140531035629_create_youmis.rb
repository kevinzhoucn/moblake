class CreateYoumis < ActiveRecord::Migration
  def change
    create_table :youmis do |t|
      t.string :order, :length => 16, :default => 'default'
      t.string :app, :length => 16, :default => 'default'
      t.string :ad, :length => 50, :default => 'default'
      t.integer :adid, :default => -1
      t.string :user, :default => 'default'
      t.string :device, :default => 'default'
      t.integer :chn, :default => -1
      t.float :price, :default => 0.0
      t.integer :points, :default => 'default'
      t.integer :time, :default => 'default'
      t.string :sig, :length => 8, :default => 'default'
      t.string :sign, :length => 36, :default => 'default'
      t.string :source, :default => 'default'

      t.timestamps
    end
  end
end
