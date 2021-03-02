module Api
  module V1
    class RechargesController < ApplicationController
      before_action :load_customer, :load_card

      def create
        @recharge = Recharge.new(recharges_params)

        if @recharge.save
          render json: {}, status: :created
        else
          render json: { errors: @recharge.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def recharges_params
        params.require(:recharge).permit(:amount).merge(
          customer_id: @customer.id, card_id: @card.id
        )
      end

      def load_customer
        @customer = Customer.find_by!(msisdn: params[:customer_msisdn])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: ['customer not found'] }, status: :not_found
      end

      def load_card
        @card = @customer.cards.find_by!(
          bin: params.dig(:recharge, :bin),
          last_digits: params.dig(:recharge, :last_digits)
        )
      rescue ActiveRecord::RecordNotFound
        render json: { errors: ['customer not found'] }, status: :not_found
      end
    end
  end
end
