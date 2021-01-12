Rails.application.routes.draw do
  resources :tweets do
    resources :comments, only: %i[new create]
  end

  root to: 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
