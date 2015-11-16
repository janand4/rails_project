class ItinerarySite < ActiveRecord::Base
	 has_many :itineraries
	 serialize :sitedetails
end
