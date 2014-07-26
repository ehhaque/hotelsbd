class Room < ActiveRecord::Base

	belongs_to :hotel
	validates :hotel_id, presence: true
	has_many :paintings
	has_many :reservations

	:currency == "$"

	validates :room_type,  presence: true
	validates :bed_type,  presence: true
	validates :num_beds,  presence: true
	validates :price,  presence: true
	#validates :currency,  presence: true
	validates :price, :numericality => {:only_decimal => true}
	validates :num_beds, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
	validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100000}

	def first_pic
		@painting = self.paintings.first
	end

end


