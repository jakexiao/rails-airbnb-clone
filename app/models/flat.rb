class Flat < ApplicationRecord
  belongs_to :user

  has_many :reviews, through: :bookings
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
