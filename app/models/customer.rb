class Customer < ApplicationRecord
  has_many :rentals, dependent: :nullify
  validates :name, presence: true
  validates :movies_checked_out_count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :postal_code, presence: true

  # def self.sort_by(term)
  #   terms =["id", "name", "city", "state", "postal_code", "registered_at", "account_credit", "movies_checked_out_count"]
  #   if term.nil?
  #     self.order(:id)
  #   elsif terms.include?(term)
  #     self.order(term.to_sym)
  #   else
  #     raise ArgumentError.new("Invalid Sort Term")
  #   end
  # end
end
