Rails.application.routes.draw do
  
  namespace :customers do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
  end
  namespace :customers do
    get 'orderd_items/index'
    get 'orderd_items/show'
    get 'orderd_items/finish'
    get 'orderd_items/confirm'
    get 'orderd_items/create'
  end
  namespace :customers do
    get 'items/index'
    get 'items/show'
  end
  namespace :customers do
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update] do
      get '/orders' => 'orders#index'
    end
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orderd_items, only: [:update]
  end
  
  scope module: :customers do
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    root to: 'tops#index'
    get '/about' => 'tops#about'
    resources :items, only: [:index, :show]
    post 'orders/confirm'
    get 'orders/finish'
    resources :orders, only: [:index, :show, :new, :create]
    resources :shippings, only: [:index, :edit, :create, :update, :destroy]
    delete 'carts/all_destroy'
    resources :carts, only: [:index, :create, :update, :destroy]
    resources :orderd_items, only: [:index, :show]
  end
  
  get '/contact' => 'contact#index'
  get '/contact/confirm' => 'contact#confirm'
  get '/contact/thanks' => 'contact#thanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
