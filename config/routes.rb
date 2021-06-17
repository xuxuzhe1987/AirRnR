Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: 'pages#home'
  resources :users, :books do
    resources :bookings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

