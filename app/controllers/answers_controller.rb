class AnswersController < ApplicationController

  before_action :find_required_content, only:[:index]

  def index

  end

  def create
    if params[:id] == "-1"
      answer = Question.find(params[:question_id]).answers.build(params_valid)
      answer.user_id = params[:user_id]
      answer.project_id = params[:project_id]
      if answer.save
        redirect_to project_answers_path()
      else
        render html: "Failed"
      end
    else
      answer = Answer.find(params[:id])
      if answer.update(params_valid)
        redirect_to project_answers_path()
      else
        render html: "Failed"
      end
    end

    respond_to do |format|
      format.html
      format.json
    end

  end

  def display_file
    @file = ProjectFile.find(params[:file_id])
    respond_to do |format|
      format.js
    end
  end


  def find_required_content
    project_id = params[:project_id]
    @questions = Question.where(project_id: project_id)
    @files = ProjectFile.where(project_id: project_id)
    @file = @files.first
  end

  def params_valid
    params_valid = params.require(:answer).permit(:answer_text)
  end


end
