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
  get 'order/create'
  get 'review/create'
  get 'review/destroy'
  get 'section/show'
  get 'user/create'
  get 'user/destroy'
  get 'session/create'
  get 'session/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
