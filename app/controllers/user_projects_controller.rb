class UserProjectsController < ApplicationController
  def index
      render :controller => 'user_project', :action => 'create'
    #   render html: "Hello"
  end
  def create
      render html: "I'm Here"
     @user_project = user_project.build(params_valid)
     if @user_project.save
         redirect_to "#"
     else
         render 'new'
     end
  end
  
  def params_valid
         params.require(:user_project).permit(:user_id, :project_id)
  end
end
