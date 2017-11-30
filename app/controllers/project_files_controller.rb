class ProjectFilesController < ApplicationController
    before_action :find_project_file, only:[:show, :update, :edit, :destroy]
    
    def new
      @project_file = ProjectFile.new(project_id: params[:project_id])
      @url = project_project_files_path
    end
    
    def show
    end

    def new_multile_files
      @project_file = ProjectFile.new(project_id: params[:project_id])
      puts params[:file_name]
    end

    def create_multile_files
      puts params[:file_name]
    end
    
    def create
      puts params_valid
      @project_file = Project.find(params[:project_id]).project_files.build(params_valid) 
      if(@project_file.save)
          flash[:success] = "Project file successfully created!"
          redirect_to project_project_files_path
      else
        @url = project_project_files_path
        render :new
      end
    end
    
    def index
      @project_files = if params[:term]
      ProjectFile.where(project_id: params[:project_id]).where('file_name LIKE ?', "%#{params[:term]}%").order("created_at DESC")
    else
      ProjectFile.where(project_id: params[:project_id]).order("created_at DESC")
    end
    end
    
    def edit
      @url = project_project_file_path
    end

    def update
      if @project_file.update(params_valid)
          flash[:success] = "Project file updated!"
          redirect_to project_project_file_path(id: @project_file.id)
      else
          @url = project_project_file_path
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
         params.require(:project_file).permit(:file_name, :description, :attachment, :term)
      end
    
end
