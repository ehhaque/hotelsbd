class Painting < ActiveRecord::Base
	
	belongs_to :room
  	mount_uploader :image, ImageUploader

  	validates :image,  presence: true

end
