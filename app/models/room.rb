class Room < ActiveRecord::Base

	belongs_to :hotel
	validates :hotel_id, presence: true

	validates :room_type,  presence: true
	validates :bed_type,  presence: true
	validates :num_beds,  presence: true
	validates :price,  presence: true
	validates :currency,  presence: true
end


