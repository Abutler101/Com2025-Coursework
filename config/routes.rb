Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: %i[index show] do
    resources :reviews, only: %i[create destroy]
  end
  resources :sections, only: [:show]
  resource :carts, only: [:show] do
    put :add_item
    delete :remove_item
  end
  resources :orders, only: %i[create show]

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end


  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/shutdown' => 'users#destroy'
  get '/getintouch' => 'contact#new'
  post 'submit_contact' => 'contact#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'legal' => 'legal#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
