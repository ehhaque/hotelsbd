class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  validates :room_id,  presence: true
  validates :firstname,  presence: true
  validates :lastname,  presence: true
  validates :phone,  presence: true
  validates :start_date,  presence: true
  validates :end_date,  presence: true
  validates :phone, numericality: {only_integer: true}
end
