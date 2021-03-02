class Recharge < ApplicationRecord
  validates_presence_of :amount, :customer_id, :card_id
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :customer
  belongs_to :card
end
