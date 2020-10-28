Rails.application.routes.draw do
  root 'product#index'
  resources :product, only: [:index, :show] do
    resources :review, only: [:create, :destroy]
  end
  resources :section, only: [:show]
  resource :cart, only: [:show] do
    put :update
    delete :remove
  end
  resources :order, only: [:create, :show]

  get '/signup' =>'user#create'
  post '/signup' => 'user#create'
  get '/shutdown' => 'user#destroy'
  get '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
