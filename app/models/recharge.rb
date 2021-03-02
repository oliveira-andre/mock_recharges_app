class Recharge < ApplicationRecord
  validates_presence_of :amount, :customer_id, :card_id
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :customer
  belongs_to :card

  validate :card_denied
  validate :customer_denied

  before_create :set_token

  private

  def card_denied
    return unless card.denied?

    @errors.add(:card_id, 'your card is blacklisted')
  end

  def customer_denied
    return unless customer.denied?

    @errors.add(:customer_id, 'you are blacklisted')
  end

  def set_token
    self.token = JWT.encode(
      { amount: amount, created_at: created_at }, nil, 'none'
    )
  end
end
