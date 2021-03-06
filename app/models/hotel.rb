class Hotel < ActiveRecord::Base

	belongs_to :user
	has_many :rooms, dependent: :destroy
	validates :user_id, presence: true

	validates :name,  presence: true
	validates :star_rating,  presence: true
	validates :address, presence: true, length: { maximum: 140 }
	validates :city,  presence: true

end
