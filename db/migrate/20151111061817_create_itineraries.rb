class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
