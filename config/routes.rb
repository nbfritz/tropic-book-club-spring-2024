Rails.application.routes.draw do
# START:edit:3
  resources :widgets, only: [ :show ]
# END:edit:3


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "manufacturer/:id", to: "manufacturers#show"
end
