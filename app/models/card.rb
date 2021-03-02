class Card < ApplicationRecord
  enum status: {
    active: 0,
    denied: 1
  }

  validates_presence_of :bin, :last_digits, :status, :customer_id
  validates :bin, length: { minimum: 4 }
  validates :last_digits, length: { is: 4 }
  validates :bin, uniqueness: { scope: :last_digits }

  belongs_to :customer
  has_many :recharges
end
