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
                                new(params_valid) 
      if(@question.save)
        if params[:question][:parent_id].nil? then 
          redirect_to project_questions_path
        else
          redirect_to project_question_path(id: params[:question][:parent_id])
        end
      else
        @parent_id =  params[:question][:parent_id]
        @url = project_questions_path
        render :new
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
          @url = project_question_path
          render 'edit'
      end
    end
    
    def add_question 
      
      old_record = Question.find(params[:id]);
      
      params[:project][:project_ids].each do |p|
          
          new_record = old_record.dup
          new_record.project_id = p
          new_record.save!

          if old_record.options.present? then
            old_record.options.each do |o|
              new_option = o.dup
              new_option.question_id = new_record.id
              new_option.save!
            end
          end
          
      end
      
      redirect_to project_question_path(id: params[:id])
      
    end
    
    def copy_question
      
      @user_projects = current_user.projects.where.not(id: params[:project_id])
    
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
         params.require(:question).permit(:title, :description, :parent_id, :q_type, :term)
      end
end
