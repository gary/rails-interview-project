Rails.application.routes.draw do
  resources :questions, only: [:index], defaults: { format: :json }
end
