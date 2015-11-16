class AddCountryIdToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :country_id, :integer
  end
end
