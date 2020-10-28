Rails.application.routes.draw do
  root 'product/index'
  resources :product, only: %i[index show] do
    resources :review, only: %i[create destroy]
  end
  resources :section, only: %i[show]
  resource :cart, only: %i[show] do
    put :update
    delete :remove
  end
  resources :order, only: %i[create show]

  get '/signup', to: 'user#create'
  post '/signup', to: 'user#create'
  get '/shutdown', to: 'user#destroy'
  get '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
