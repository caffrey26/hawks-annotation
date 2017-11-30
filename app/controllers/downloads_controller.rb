class DownloadsController < ApplicationController
  def index
    
    # @latest_answers = if Answer.group(:question_id).count.empty? then 0 else Answer.group(:question_id).pluck(:id).count end
     @latest_answers = Answer.where("project_id in (?) and created_at in (SELECT MAX(answers.created_at) FROM answers GROUP BY answers.question_id ORDER BY MAX(created_at) DESC)", params[:project_id]).count
     @all_answers = Answer.where(project_id: params[:project_id]).count
     @own_answers = Answer.where(user_id: current_user.id, project_id: params[:project_id]).count

    if params[:type] == "latest" then
      # @answers = Answer.group(:question_id)
      # @answers = Answer.where("created_at in (SELECT MAX(answers.created_at) FROM answers GROUP BY answers.question_id ORDER BY MAX(created_at) DESC)")
      @answers = Answer.where("project_id in (?) and created_at in (SELECT MAX(answers.created_at) FROM answers GROUP BY answers.question_id ORDER BY MAX(created_at) DESC)", params[:project_id])
    
    end
    if params[:type] == "all" then
      # answers = Answer.joins("JOIN OPTIONS, QUESTIONS on questions.id = options.question_id and questions.id=answers.question_id and questions.q_type ='O' and answers.answer_text = options.id and answers.project_id = " + params[:project_id]).distinct.pluck("questions.title", "options.option_text")
      # answers = answers + Answer.joins("JOIN QUESTIONS on questions.id=answers.question_id and questions.q_type = 'T' and answers.project_id = " + params[:project_id]).distinct.pluck("questions.title", "answers.answer_text")
      @answers = Answer.where(project_id: params[:project_id])
    end
    if params[:type] == "own" then
      @answers = Answer.where(user_id: current_user.id, project_id: params[:project_id])
    end
    if params[:type].nil?
      then
    else 
      if @answers.empty? then 
        flash[:error] = "No answers to download!"
        return redirect_to project_downloads_path(project_id: params[:project_id], format: "html")
      end
    end
      
    respond_to do |format|
      format.html
      format.csv { send_data @answers.to_csv , filename: "answers-#{Date.today}.csv" }
    end
  end
end