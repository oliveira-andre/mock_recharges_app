class Card < ApplicationRecord
  enum status: {
    active: 0,
    denied: 1
  }

  validates_presence_of :bin, :last_digits, :status, :user_id
  validates_presence_of :bin, length: { minimum: 4 }
  validates_presence_of :last_digits, length: { is: 4 }

  belongs_to :customer
  has_many :recharges
end
