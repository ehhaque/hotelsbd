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
  validates :guest_email,  presence: true
  validates_format_of :guest_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
