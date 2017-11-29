class DownloadsController < ApplicationController
  def index
    if params[:type] == "latest" then
      @answers = Answer.group(:question_id)
    end
    if params[:type] == "all" then
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