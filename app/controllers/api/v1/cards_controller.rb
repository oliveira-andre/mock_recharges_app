module Api
  module V1
    class CardsController < ApplicationController
      before_action :load_customer

      def create
        @card = Card.new(cards_params.merge(customer_id: @customer.id))

        if @card.save
          render json: {}, status: :created
        else
          render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def cards_params
        params.require(:card).permit(:bin, :last_digits)
      end

      def load_customer
        @customer = Customer.find_by!(msisdn: params[:customer_msisdn])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: ['customer not found'] }, status: :not_found
      end
    end
  end
end
