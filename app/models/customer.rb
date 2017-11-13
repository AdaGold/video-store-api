class Customer < ApplicationRecord
  has_many :rentals, dependent: :nullify
  validates :name, presence: true
  validates :movies_checked_out_count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # validates :postal_code, presence: true

  def self.sort_by(term, n, p)
    term ||= "id"
    n ||= "10"
    p ||= "1"
    
    unless p.to_i > 0 && n.to_i > 0
      raise ArgumentError
    end

    terms =["id", "name", "city", "state", "postal_code", "registered_at", "account_credit", "movies_checked_out_count"]

    start = (p.to_i-1)*n.to_i
    finish = (p.to_i)*n.to_i - 1

    if terms.include?(term)
      self.order(term.to_sym)[start..finish]
    else
      raise ArgumentError.new("Invalid Sort Term")
    end
  end
end
