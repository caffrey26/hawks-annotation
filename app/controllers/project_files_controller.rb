class ProjectFilesController < ApplicationController
    
    def new
        if params.has_key?(:id)
            @project_file = ProjectFile.new
        else
            render html: "Invalid URL"
        end
    end
    
    def show
      @project_file = ProjectFile.find(params[:id]) 
    end
    
    def create
      render params[:id]     
    #   @project_file = Project.find(params[:id]).project_files.build(params_valid) 
    #   if(@project_file.save)
    #       render "Hi"
    #   end
    end
    
    
    private
  
      def params_valid
         params.require(:project_file).permit(:file_name, :description)
      end
    
end
