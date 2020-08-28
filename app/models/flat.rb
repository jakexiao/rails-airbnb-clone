class Flat < ApplicationRecord
  belongs_to :user

  has_many :reviews, through: :bookings
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many_attached :photos
end
