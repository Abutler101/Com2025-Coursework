Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: %i[index show] do
    resources :reviews, only: %i[create destroy]
  end
  resources :sections, only: %i[index show]
  resource :carts, only: [:show] do
    put :add_item
    delete :remove_item
  end
  resources :orders, only: %i[create show]

  namespace :admin do
    root to: 'dashboard#index'
    resources :products, :sections, :users, except: %i[edit update show]
    resources :orders, only: %i[index show destroy]
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

  #HTTP error routes
  get '/403' => 'errors#forbidden'
  get '/404' => 'errors#not_found'
  get '/422' => 'errors#unacceptable'
  get '/500' => 'errors#internal_error'

end
