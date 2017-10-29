class ProjectsController < ApplicationController
  
  before_action :find_project, only:[:show, :update, :edit, :destroy, :show_and_select_user]
  
  def show_and_select_user
          @users = User.where.not(id: current_user.id)
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
    
        
        @project = Project.find(params[:project_id])
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
    #   render html: "Here"
      @project = Project.find(params[:id])
  end
  
  private
  
      def params_valid
         params.require(:project).permit(:title, :description)
      end
end
