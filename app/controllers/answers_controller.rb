class AnswersController < ApplicationController
    before_action :find_project, only:[:index]
     
    def index
    end
    
    # def show
    #     @question = Question.find(params[:question_id]) 
    # end
    
    def new
        @question = Question.find(params[:question_id]) 
        @answer = Answer.new
        @file =  ProjectFile.find(params[:file_id])
        @files = ProjectFile.where(project_id: params[:project_id])
    end
    
    def find_project
       @project_id = params[:project_id]
       @files = ProjectFile.where(project_id: params[:project_id])
       @first_file_id = ProjectFile.where(project_id: params[:project_id]).pluck(:id)[0]
       @questions = Question.where(project_id: params[:project_id])
    end
end
