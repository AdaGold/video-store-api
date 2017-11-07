class Rental < ApplicationRecord
  belongs_to :customer, foreign_key: true
  belongs_to :movie, foreign_key: true
end
