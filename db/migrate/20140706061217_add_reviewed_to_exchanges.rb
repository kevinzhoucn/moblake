class AddReviewedToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :reviewed, :boolean, :default => false
    add_column :exchanges, :reviewed_type, :integer, :default => 0
  end
end
