class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :flat

    has_many :reviews

    def total_price
      self.flat.price*(self.end_date.to_date - self.start_date.to_date).to_i
    end 
end
