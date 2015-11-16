class AddAttachmentImageToItineraries < ActiveRecord::Migration
  def self.up
    change_table :itineraries do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :itineraries, :image
  end
end
