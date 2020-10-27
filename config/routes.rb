Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'issues/:number/events', to: 'events#index'
      post 'events/create_event', to: 'events#create'
    end
   end
end
