Rails.application.routes.draw do
  root "questionnaires#index"

  resources :questionnaires, only: [:create, :new, :show]
  resources :responses, only: [:create, :index]
end
