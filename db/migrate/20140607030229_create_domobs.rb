class CreateDomobs < ActiveRecord::Migration
  def change
    create_table :domobs do |t|
      t.string :orderid, :length => 20, :default => 'default'
      t.string :pubid, :length => 20, :default => 'default'
      t.string :ad, :length => 50, :default => 'default'
      t.integer :adid, :default => -1
      t.string :user, :default => 'default'
      t.string :device, :default => 'default'
      t.integer :channel, :default => -1
      t.float :price, :default => 0.0
      t.integer :point, :default => 'default'
      t.integer :ts, :default => 0
      t.string :sign, :length => 50, :default => 'default'
      t.string :source, :default => 'default'

      t.timestamps
    end
  end
end
