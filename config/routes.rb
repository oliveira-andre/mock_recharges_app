Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: %i[create show], param: :msisdn do
        resources :cards, only: :create
        resources :recharges, only: :create
      end
    end
  end
end
