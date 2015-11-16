class AddCityIdToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :city_id, :integer
  end
end
