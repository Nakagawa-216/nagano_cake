Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  # ログイン時に使用されるviewファイルを指定
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin' => 'admins/homes#top'
  get 'admin/genres' => 'admins/genres#index', as: 'admin/genres'
  post 'admin/genres' => 'admins/genres#create'
  resources :genres, only: [:edit, :updete]
end
