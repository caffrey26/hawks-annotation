Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :project_files
  root 'projects#index'
  
  # get '/projects/:id' => 'projects#show', as: :all_projects
  
  # get '/project_files/:id' => 'project_files#show', as: :all_files
  get '/projects/:id/project_files/new' => 'project_files#new', as: :new_project_file
end
