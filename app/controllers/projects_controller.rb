class ProjectsController < ApplicationController
  
  before_action :find_project, only:[:show, :update, :edit, :destroy]
  
  def index
      if(current_user.present?)
          @projects = Project.where(user_id: current_user.id).order("created_at DESC")
        #   @welcome = "Welcome to Hawks Annotation! Sign in or sign up to continue"
      end
  end
  
  def new
     @project = current_user.projects.build
  end
  
  def create
     @project = current_user.projects.build(params_valid)
     if @project.save
         redirect_to root_path
     else
         render 'new'
     end
  end
  
  def show
      @projects = Project.find(params[:id]) 
      @project_files = @project.project_files
  end
  
  def update
      if @project.update(params_valid)
          redirect_to project_path(@project)
      else
          render 'edit'
      end
  end
  
  def edit
  end
  
  def destroy
      Project.destroy(@project)
  end
  
  def find_project
      @project = Project.find(params[:id])
  end
  
  private
  
      def params_valid
         params.require(:project).permit(:title, :description)
      end
end
