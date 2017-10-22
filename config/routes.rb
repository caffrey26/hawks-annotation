Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :user_projects
  root 'projects#index'
  get 'users/show_and_select_user' => 'users#show_and_select_user', :as => :show_and_select_user

end
