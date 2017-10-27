Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :project_files
  end
  root 'projects#index'
  
  # get '/projects/:id' => 'projects#show', as: :all_projects
  # get '/project_files/:id' => 'project_files#show', as: :all_files
  # get '/projects/:project_id/project_files/new' => 'project_files#new', as: 'project_new_file'
end
