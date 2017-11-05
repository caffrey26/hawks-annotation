class ProjectFilesController < ApplicationController
    before_action :find_project_file, only:[:show, :update, :edit, :destroy]
    
    def new
        @project_file = ProjectFile.new(project_id: params[:project_id])
        @url = project_project_files_path

    end
    
    def show
    end
    
    def create
      @project_file = Project.find(params[:project_id]).project_files.build(params_valid) 
      if(@project_file.save)
          redirect_to project_project_files_path
      else
        render html:"error in saving"
      end
    end
    
    def index
      @project_files = ProjectFile.where(project_id: params[:project_id]).order("created_at DESC")
    end
    
    def edit
      @url = project_project_file_path
    end

    def update
      if @project_file.update(params_valid)
          redirect_to project_project_file_path(id: @project_file.id)
      else
          render 'edit'
      end
    end
    
    def destroy
      ProjectFile.destroy(@project_file)
      redirect_to project_project_files_path
    end

    
    def find_project_file
      @project_file = ProjectFile.find(params[:id])
    end
    
    
    private
  
      def params_valid
         params.require(:project_file).permit(:file_name, :description, :attachment)
      end
    
end
