class AnswersController < ApplicationController

  before_action :find_required_content, only:[:index]

  def index

  end

  def create
    @q_id = params[:question_id]

    if params[:id] == "-1"
      answer = Question.find(params[:question_id]).answers.build(params_valid)
      answer.user_id = params[:user_id]
      answer.project_id = params[:project_id]
      answer.save
    else
      answer = Answer.find(params[:id])
      answer.update(params_valid)
    end

    respond_to do |format|
      # format.html
      format.js
    end
  end

  # def display_file
  #   @files = ProjectFile.where(params[:project_id])
  #   @file = ProjectFile.find(params[:file_id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def add_ref
    @question = Question.find(params[:question_id])
    if Reference.where(question_id: params[:question_id], file_id: params[:file_id]).length == 0
      r = Reference.new(answer_id: params[:answer_id], question_id: params[:question_id], user_id: current_user.id, file_id: params[:file_id])
      r.save
    end
    respond_to do |format|
      format.js
    end
  end
  
  def remove_ref
    @question = Question.find(Reference.find(params[:reference_id]).question_id)
    Reference.find(params[:reference_id]).destroy
    respond_to do |format|
      format.js
    end
  end
  
  def remove_annotation
   @question = Question.find(Reference.find(params[:reference_id]).question_id)
   Annotation.find(params[:annotation_id].destroy)
  respond_to do |format|
      format.js
    end
  end
  

  def add_annotation
    @file = ProjectFile.find(params[:file_id])
    @question = Question.find(params[:question_id])
    # @answer = Answer.find(params[:answer_id])

    a = Annotation.new(question_id: params[:question_id], user_id: current_user.id, file_id: params[:file_id])
    a.text = params[:annotation][:text].to_s
    if a.save
      @ref = "collapseInnerfile-id-" + params[:file_id] + "question-id-" + params[:question_id]
      puts(@ref)
    end
    # {render layout: true, content_type: 'text/javascript'}
    respond_to do |format|
      format.js {render content_type: 'text/javascript'}
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
