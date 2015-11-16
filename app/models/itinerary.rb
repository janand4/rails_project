class Itinerary < ActiveRecord::Base
	acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>" }, default_url: "http://www.wanderlust.ly/wp-content/uploads/2015/01/destination-172x172.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
 

end
