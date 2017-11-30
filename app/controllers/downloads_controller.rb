class DownloadsController < ApplicationController
  def index
    if params[:type] == "latest" then
      @answers = Answer.group(:question_id)
    end
    if params[:type] == "all" then
      # answers = Answer.joins("JOIN OPTIONS, QUESTIONS on questions.id = options.question_id and questions.id=answers.question_id and questions.q_type ='O' and answers.answer_text = options.id and answers.project_id = " + params[:project_id]).distinct.pluck("questions.title", "options.option_text")
      # answers = answers + Answer.joins("JOIN QUESTIONS on questions.id=answers.question_id and questions.q_type = 'T' and answers.project_id = " + params[:project_id]).distinct.pluck("questions.title", "answers.answer_text")
      @answers = Answer.all
    end
    if params[:type] == "own" then
      @answers = Answer.where(user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.csv { send_data @answers.to_csv, filename: "answers-#{Date.today}.csv" }
    end
  end
end