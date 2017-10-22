class ProjectsController < ApplicationController
  
  before_action :find_project, only:[:show, :update, :edit, :destroy]
  
  def index
      @projects = Project.all.order("created_at DESC")
  end
  
  def new
     @project = Project.new
  end
  
  def create
     @project = Project.new(params_valid)
     if @project.save
         redirect_to root_path
     else
         render 'new'
     end
  end
  
  def show
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
