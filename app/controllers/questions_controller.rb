class QuestionsController < ApplicationController
    before_action :find_question, only:[:show, :update, :edit, :destroy]
    
    def new
        @question = Question.new(project_id: params[:project_id])
        @parent_id = params[:parent_id]
        @url = project_questions_path
    end
    
    def show
    end
    
    def create
      @question = Project.find(params[:project_id]).
                              questions.
                                new(
                                    :title => params[:question][:title], 
                                    :q_type => params[:type],
                                    :description => params[:question][:description],
                                    :parent_id => params[:question][:parent_id]
                                    ) 
      if(@question.save)
        if params[:question][:parent_id].nil? then 
          redirect_to project_questions_path
        else
          redirect_to project_question_path(id: params[:question][:parent_id])
        end
      else
        render html: "error saving"
      end
    end
    
    def index
      @questions = if params[:term]
        Question.where(project_id: params[:project_id]).where('title LIKE ?', "%#{params[:term]}%").order("created_at DESC")
      else
        Question.where(project_id: params[:project_id]).order("created_at DESC")
      end
    end
    
    def edit
      @url = project_question_path
    end

    def update
      if @question.update(params_valid)
          redirect_to project_question_path(id: @question.id)
      else
          render 'edit'
      end
    end
    
    def destroy
      Question.destroy(@question)
      redirect_to project_questions_path
    end

    
    def find_question
      @question = Question.find(params[:id])
    end
    
    
    private
  
      def params_valid
         params.require(:question).permit(:title, :description, :type, :term)
      end
end
