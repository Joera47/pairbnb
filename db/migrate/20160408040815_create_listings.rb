class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
   	  t.string :user_id
      t.string :home_type
      t.string :room_type
      t.integer :no_of_guest
      t.string :location
      t.integer :price
      t.string :user_address
      t.integer :no_of_bed
      t.integer :no_of_bathroom
      t.string :description
      t.string :availability
      t.timestamps null: false
    end
  end
end
