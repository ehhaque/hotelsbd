class Hotel < ActiveRecord::Base

	belongs_to :user
	validates :user_id, presence: true

	validates :name,  presence: true
	validates :star_rating,  presence: true
	validates :city,  presence: true

end
