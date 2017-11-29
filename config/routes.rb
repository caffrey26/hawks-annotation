Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :answers do
      collection do
        get :display_file, :add_ref , :remove_ref
        post :add_annotation, :remove_annotation
      end
    end
    resources :project_files
    resources :questions do
      resources :options
    end
    resources :downloads
  end

  # get '/projects/homepage' => 'projects#show', as: :all_projects
  # get '/project_files/:id' => 'project_files#show', as: :all_files
  # get '/projects/:project_id/project_files/new' => 'project_files#new', as: 'project_new_file'S
  resources :user_projects
  root 'projects#homepage'
  get 'projects/:id/show_and_select_user' => 'projects#show_and_select_user', :as => :show_and_select_user
  get 'projects/:project_id/questions/:id/copy_question' => 'questions#copy_question', :as => :copy_question

  post 'projects/:id/add' => 'projects#add', :as => :add_user
  post 'projects/:project_id/questions/:id/add_question' => 'questions#add_question', :as => :add_question

end
