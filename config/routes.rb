Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :project_files
    resources :questions do
      resources :options
    end
  end

  # get '/projects/:id' => 'projects#show', as: :all_projects
  # get '/project_files/:id' => 'project_files#show', as: :all_files
  # get '/projects/:project_id/project_files/new' => 'project_files#new', as: 'project_new_file'S
  resources :user_projects
  root 'projects#index'
  get 'projects/:id/show_and_select_user' => 'projects#show_and_select_user', :as => :show_and_select_user
  post 'projects/:id/add' => 'projects#add', :as => :add_user

end
