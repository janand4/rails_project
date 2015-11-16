class AddSiteDetailsToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :sitedetails, :text
  end
end
