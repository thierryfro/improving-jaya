Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'events', to: 'events#index'
      # post 'create_tracker', to: 'coupon_leads#create_coupon'
    end
   end
  # list of events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
