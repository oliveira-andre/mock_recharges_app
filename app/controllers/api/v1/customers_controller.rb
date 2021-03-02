module Api
  module V1
    class CustomersController < ApplicationController
      before_action :load_customer, only: :show

      def create
        @customer = Customer.new(customers_params)

        if @customer.save
          render json: { customer: @customer }, status: :created
        else
          render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: { customer: @customer }
      end

      private

      def customers_params
        params.require(:customer).permit(:fullname, :msisdn)
      end

      def load_customer
        @customer = Customer.find_by(msisdn: params[:msisdn])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: ['customer not found'] }, status: :not_found
      end
    end
  end
end
