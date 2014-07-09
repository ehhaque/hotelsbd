class Room < ActiveRecord::Base

	belongs_to :hotel
	validates :hotel_id, presence: true

	
end
