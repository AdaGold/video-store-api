class Customer < ApplicationRecord
  has_many :rentals, dependent: :nullify
  validates :name, presence: true
  validates :movies_checked_out_count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :postal_code, presence: true

  def self.sort_by(term)
    if term.nil?
      self.order(:id)
    else
      self.order(term.to_sym)
    end
  end
end
