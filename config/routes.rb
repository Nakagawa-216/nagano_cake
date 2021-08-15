Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  # 使用されるviewファイルを指定
  # devise_for :customers, controllers: {
  #   sessions: 'public/sessions',
  #   registrations: 'public/registrations'
  # }

  # devise_for :customer, only: [:registration] do
  #   get 'customer/sign_up', to: 'public/registrations#new', as: :new_customer_registration
  #   post 'customers', to: 'public/registrations#create'
  # end

  devise_for :customers, skip: 'registrations',
  controllers: { sessions: 'public/sessions', registrations: 'public/registrations' }
  devise_scope :customer do
    get 'customer/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post 'customers', to: 'public/registrations#create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'

  get 'admin' => 'admins/homes#top'

  get 'admin/genres' => 'admins/genres#index', as: 'admin/genres'
  post 'admin/genres' => 'admins/genres#create'
  get 'admin/genres/:id/edit' => 'admins/genres#edit', as: 'edit/admin/genres'
  patch 'admin/genres/:id/edit' => 'admins/genres#update'

  get 'admin/items/new' => 'admins/items#new', as: 'new/admin/items'
  post 'admin/items/new' => 'admins/items#create', as: ''
  get 'admin/items/:id' => 'admins/items#show', as: 'admin/item'
  get 'admin/items' => 'admins/items#index', as: 'admin/items'
  get 'admin/items/:id/edit' => 'admins/items#edit', as: 'edit/admin/item'
  patch 'admin/items/:id/edit' => 'admins/items#update'

  get 'admin/customers' => 'admins/customers#index', as: 'admin/customers'
  get 'admin/customers/:id' => 'admins/customers#show', as: 'admin/customer'
  get 'admin/customers/:id/edit' => 'admins/customers#edit', as: 'edit/admin/customer'
  patch 'admin/customers/:id/edit' => 'admins/customers#update'

  get 'admin/orders/:id' => 'admins/orders#show', as: 'admin/order'
  patch 'admin/orders/:id' => 'admin/orders#update'

  get 'about' => 'public/homes#about', as: 'about'

  get 'customers/my_page' => 'public/customers#show', as: 'mypage'
  get 'customers/edit' => 'public/customers#edit', as: 'edit/customer'
  patch 'customers/edit' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch 'customer/withdraw' => 'public/customers#withdraw', as: 'withdraw'

  get 'addresses' => 'public/addresses#index', as: 'addresses'
  post 'addresses' => 'public/addresses#create'
  get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit/address'
  patch 'addresses/:id/edit' => 'public/addresses#update'
  delete 'addresses/:id' => 'public/addresses#destroy', as: 'destroy/address'

  get 'items' => 'public/items#index', as: 'items'
  get 'items/:id' => 'public/items#show', as: 'item'

  get 'cart_items' => 'public/cart_items#index'
  post 'cart_items' => 'public/cart_items#create', as: 'cart_item'
  delete 'cart_items/:id' => 'public/cart_items#destroy', as: 'destroy/cart_item'
  patch 'cart_items/:id' => 'public/cart_items#update', as: 'update/cart_item'
  delete 'cart_items' => 'public/cart_items#destroy_all', as: 'destroy_all/cart_item'
end
