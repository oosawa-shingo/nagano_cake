Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


resources :orders

namespace :admin do
  resources :orders
end

resources :items

namespace :admin do
  resources :items
end

resources :customers

namespace :admin do
  resources :customers
end

resources :cart_items


end
