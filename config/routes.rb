Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    match :add, via: [:get, :post]
  end
  resources :user_projects
  root 'projects#index'
  get 'projects/:id/show_and_select_user' => 'projects#show_and_select_user', :as => :show_and_select_user
  patch 'projects/:id/add' => 'projects#add', :as => :add_user
end
