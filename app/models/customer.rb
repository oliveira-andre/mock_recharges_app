class Customer < ApplicationRecord
  enum status: {
    active: 0,
    denied: 1
  }

  validates_presence_of :fullname, :msisdn, :status
  validates :msisdn, length: { is: 11 }
  validates :msisdn, uniqueness: true

  has_many :cards
  has_many :recharges
end
