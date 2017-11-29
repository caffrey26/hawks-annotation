class OptionsController < ApplicationController
    def new
        @option = Option.new(question_id: params[:question_id])
        @url = project_question_options_path
        
        # render html: "Under Constuction"
    end
    
    def create
      @option = Question.find(params[:question_id]).
                              options.
                                build(params_valid) 
      if(@option.save)
          flash[:success] = "Option successfully created!"
          redirect_to project_question_path(id: params[:question_id])
      else
        @url = project_question_options_path
        render :new
      end
    end
    
    def edit
      @option = Option.find(params[:id])
      @url = project_question_option_path
    end

    def update
      @option = Option.find(params[:id])
      if @option.update(params_valid)
          flash[:success] = "Option updated!"
          redirect_to project_question_path(id: params[:question_id])
      else
          @url = project_question_option_path
          render 'edit'
      end
    end
    def destroy
      @option = Option.find(params[:id])
      Option.destroy(@option)
      redirect_to project_question_path(id: params[:question_id])
    end
    
    private
  
     def params_valid
        params.require(:option).permit(:option_text)
     end
    
end