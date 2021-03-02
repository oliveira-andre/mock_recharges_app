# frozen_string_literal: true

module Api
  module V1
    class CustomersSerializer < ApplicationSerializer
      def serialize
        return attributes(data) unless data.respond_to?('map')

        data.map { |data| attributes(data) }.compact
      end

      def attributes(data)
        {
          fullname: data.fullname,
          msisdn: data.msisdn,
          cards: cards_attributes(data.cards),
          history: history_attributes(data.recharges)
        }.compact
      end

      def cards_attributes(cards)
        return [] if cards.empty?

        cards.map do |card|
          {
            bin: card.bin,
            last_digits: card.last_digits,
            status: card.status
          }.compact
        end
      end

      def history_attributes(recharges)
        return [] if recharges.empty?

        recharges.map do |recharge|
          {
            amount: recharge.amount,
            token: recharge.token
          }.compact
        end
      end
    end
  end
end
