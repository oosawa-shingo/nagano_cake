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
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/my_page/edit' => 'customers#edit'
    patch '/customers/my_page/edit' => 'customers#update'
    get '/customers/confirm'
    patch '/customers/withdrawn'
    delete '/cart_items/destroy_all'
    post '/cart_items/:id' => 'cart_items#update'
    post 'orders/confirm'
    get 'orders/complete'
    resources :items
    resources :cart_items
    resources :orders
  end

  namespace :admin do
    root to: 'homes#top'
    resources :orders
    resources :items
    resources :customers
  end

end
