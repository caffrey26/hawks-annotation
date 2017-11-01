class ProjectsController < ApplicationController
  
  before_action :find_project, only:[:show, :update, :edit, :destroy, :show_and_select_user]
  
  def show_and_select_user
        #   @usersAssignedToProject = ProjectUser.where(project_id: :id)
          @users = User.where.not(id: ProjectUser.where(project_id: params[:id]).pluck(:user_id))
          if @users.empty? then 
              flash[:success] = "All users already added to the project"
              redirect_to project_path(params[:id])
          end
        #   @welcome = "Welcome to Hawks Annotation! Sign in or sign up to continue"
  end
  def index
      if(current_user.present?)
          @adminprojects = Project.where(admin_id: current_user.id).order("created_at DESC")
          @otherprojects = current_user.projects.where.not(admin_id: current_user.id).order("created_at DESC")
        #   @welcome = "Welcome to Hawks Annotation! Sign in or sign up to continue"
      end
  end
  def add
    # @student = Student.find(params[:student_id])
    
        
        @project = Project.find(params[:id])
        @user = User.find(params[:project][:user_ids])
        @projectUser = @project.project_users.create(user_id: @user.id)
        if @projectUser.save
          flash[:success] = "User added!"
        else
         flash[:success] = "User already added!"
        end
        flash.keep(:success)
        redirect_to project_path(@project)
  end
  def new
     @project = current_user.projects.build
  end
  
  def create
     @project = current_user.projects.create(params_valid)
     if @project.save
         @project.update(admin_id: current_user.id)
         redirect_to projects_path
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
      redirect_to projects_path
  end
  
  def find_project
    #   render html: "Here"
      @project = Project.find(params[:id])
  end
  
  
  def homepage
    @user = current_user
  end
  
  private
  
      def params_valid
         params.require(:project).permit(:title, :description)
      end
end
