Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :games, only: [:index, :create]
    end
  end
end
