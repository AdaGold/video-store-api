class Customer < ApplicationRecord
  validates :name, presence: true
  validates :movies_checked_out_count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
