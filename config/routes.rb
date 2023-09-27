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
    get '/customers/my_page' => 'customers#show'
    get '/customers/my_page/edit' => 'customers#edit'
    patch '/customers/my_page/edit' => 'customers#update'
    get '/customers/confirm'
    patch '/customers/withdrawn'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :orders
    resources :items
    resources :customers
  end

  get 'homes/about'

  resources :orders
  get 'orders/confirm'
  get 'orders/complete'

  scope module: :public do
    resources :items
  end

  resources :cart_items


end
