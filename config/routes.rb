Rails.application.routes.draw do
  resources :employees do
    resources :shifts, only: [:index]
  end

  resources :shifts, only: [:index, :create]
end
