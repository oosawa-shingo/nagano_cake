Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: 'homes#top'
  end
  namespace :admin do
    root to: 'homes#top'
  end

  get 'homes/about'

  resources :orders
  get 'orders/confirm'
  get 'orders/complete'

  namespace :admin do
    resources :orders
  end

  scope module: :public do
    resources :items
  end

  namespace :admin do
    resources :items
  end

  resources :customers
  get 'customers/confirm'

  namespace :admin do
    resources :customers
  end

  resources :cart_items


end
