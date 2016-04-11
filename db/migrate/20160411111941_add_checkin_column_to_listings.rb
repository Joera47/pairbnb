class AddCheckinColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :checkin, :date
    add_column :listings, :checkout, :date
  end
end
