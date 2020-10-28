Rails.application.routes.draw do
  get 'cart/update'
  get 'cart/remove'
  get 'order/create'
  get 'review/create'
  get 'review/destroy'
  get 'section/show'
  get 'user/create'
  get 'user/destroy'
  get 'session/create'
  get 'session/destroy'
  get 'product/index'
  get 'product/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
