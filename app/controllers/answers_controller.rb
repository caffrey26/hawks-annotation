class AnswersController < ApplicationController
    before_action :find_project, only:[:index]
     
    def index
    end
    
    # def show
    #     @question = Question.find(params[:question_id]) 
    # end
    
    def new
      @question = Question.find(params[:question_id])

      @answer = Answer.new(question_id: params[:question_id])
      # @answer.project_id = params[:project_id]
      # @answer.user_id = current_user.id

      @file =  ProjectFile.find(params[:file_id])
      @files = ProjectFile.where(project_id: params[:project_id])
    end

    def create
      alert("creating")
      params_valid = params.require(:project_answer).permit(:answer_text)
      @answer = ProjectQuestion.find(params[:question_id]).project_answers.build(params_valid)
      if @answer.save
        alert("saved!")
      end

      render 'new'

    end
    
    def find_project
       @project_id = params[:project_id]
       @files = ProjectFile.where(project_id: params[:project_id])
       @first_file_id = ProjectFile.where(project_id: params[:project_id]).pluck(:id)[0]
       @questions = Question.where(project_id: params[:project_id])
    end
end
