class CreateItinerarySites < ActiveRecord::Migration
  def change
    create_table :itinerary_sites do |t|
      t.integer :itinerary_id
      t.text :sitedetails

      t.timestamps null: false
    end
  end
end
