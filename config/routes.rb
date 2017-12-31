Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile' },
                     controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users, only: [:show]
  resources :rooms, path: 'annonces' do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get :your_trips, to: 'reservations#your_trips', path: 'mes_voyages'
  # Fix: mettre :your_trips a la place de '/your_trips'
  get :your_reservations, to: 'reservations#your_reservations', path: 'mes_reservations'
end
