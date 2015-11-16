class AddUserIdToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :user_id, :integer
    add_index :itineraries, :user_id
  end
end
