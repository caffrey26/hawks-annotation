class AnswersController < ApplicationController
    before_action :find_project, only:[:index]
     
    def index
      # download_answers = Answer.where(project_id: params[:project_id].to_s).joins(:question).includes(:question)
      download_answers = Answer
                             .joins("LEFT JOIN `questions` ON answers.question_id = questions.id")
                             .where("answers.project_id = " + params[:project_id].to_s)
                             .select("answers.*, questions.*")
                             .group("answers.question_id, answers.user_id")
                             .having("answers.updated_at = MAX(answers.updated_at)")

      respond_to do |format|
        format.html
        format.csv { send_data download_answers.to_csv}
      end
    end
    
    # def show
    #     @question = Question.find(params[:question_id]) 
    # end
    
    def new
      @question = Question.find(params[:question_id])

      questions = Question.where(project_id: params[:project_id]).order("created_at").pluck(:id)
      current_index = questions.find_index(@question.id)

      next_q = nil
      prev_q = nil
      next_q = questions[current_index + 1] unless current_index == questions.length - 1
      prev_q = questions[current_index - 1] unless (current_index - 1) < 0
      @prev_url = prev_q.nil?? "javascript:;" : new_project_answer_path(question_id: prev_q, file_id: params[:file_id])
      @next_url = next_q.nil?? "javascript:;" : new_project_answer_path(question_id: next_q, file_id: params[:file_id])

      answers = Answer.where(question_id: @question.id, user_id: current_user.id).order("created_at DESC")
      if answers.length > 0
        @answer = answers.first
      else
        @answer = Answer.new(question_id: params[:question_id])
      end

      file_ids = Array(Reference.where(question_id: params[:question_id], user_id: current_user.id).pluck(:file_id))
      refs = []
      file_ids.each do |f|
        refs << ProjectFile.find(f)
      end
      @references = refs


      # if Array(@answer.file_id).length == 0
      #   @references = nil
      # else
      #   refs = []
      #   Array(@answer.file_id).each do |f|
      #     refs << ProjectFile.find(f)
      #   end
      #   @references = refs
      # end


      # @answer.project_id = params[:project_id]
      # @answer.user_id = current_user.id

      @file =  ProjectFile.find(params[:file_id])
      @files = ProjectFile.where(project_id: params[:project_id])
    end

    def create
      params_valid = params.require(:answer).permit(:answer_text)
      if params[:id].nil?
        @answer = Question.find(params[:question_id]).answers.build(params_valid)
        @answer.user_id = params[:user_id]
        @answer.project_id = params[:project_id]
        if @answer.save
          redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
        else
          render html: "Failed"
        end
      else
        answer = Answer.find(params[:id])
        if answer.update(params_valid)
          redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
        else
          render html: "Failed"
        end
      end

    end

    def add_ref
      # params_valid = params.require(:id).permit(:file_id)
      if Reference.where(answer_id: params[:id], question_id: params[:question_id], user_id: current_user.id, file_id: params[:file_id]).length == 0
        r = Reference.new(answer_id: params[:id], question_id: params[:question_id], user_id: current_user.id, file_id: params[:file_id])
        if r.save
          redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
        end
      else
        redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
      end
        # if params[:id].nil?
      #   answer = Answer.new
      # else
      #   answer = Answer.find(params[:id])
      # end
      #
      # answer.file_id.push(params[:file_id]) unless answer.file_id.include?(params[:file_id])
      #
      # if answer.save
      #   redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
      # else
      #   render html: "failed"
      #   # redirect_to projects_answers_path
      # end

      # @answer = Question.find(params[:question_id]).answers.build(params_valid)
      # @answer.user_id = params[:user_id]
      # @answer.project_id = params[:project_id]
      # if @answer.save
      #   redirect_to new_project_answer_path(question_id: params[:question_id], file_id: params[:file_id])
      # end
    end
    
    def find_project
       @project_id = params[:project_id]
       @files = ProjectFile.where(project_id: params[:project_id])
       @first_file_id = ProjectFile.where(project_id: params[:project_id]).pluck(:id)[0]
       @questions = Question.where(project_id: params[:project_id])
    end
end
