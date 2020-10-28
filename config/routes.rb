Rails.application.routes.draw do

  root 'product#index'
  resources :product, only: %i[index show] do
    resources :review, only: %i[create destroy]
  end
  resources :section, only: [:show]
  resource :cart, only: [:show] do
    put :update
    delete :remove
  end
  resources :order, only: %i[create show]

  get '/signup' => 'user#create'
  post '/signup' => 'user#create'
  get '/shutdown' => 'user#destroy'
  get '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  get '/getintouch' => 'contact#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
