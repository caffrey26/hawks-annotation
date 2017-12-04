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
        if params[:question][:q_type] == 'TF' then
          @question.q_type = 'O'
          @question.save
          @option1 = @question.options.new(option_text: "True")
          @option2 = @question.options.new(option_text: "False")
          if @option1.valid? and @option2.valid? then
            @option1.save
            @option2.save
          # else
          #   @parent_id =  params[:question][:parent_id]
          #   @url = project_questions_path
          #   render :new
          end
        end  
          
        if params[:question][:q_type] == 'YN' then
          @question.q_type = 'O'
          @question.save
          @option1 = @question.options.new(option_text: "Yes")
          @option2 = @question.options.new(option_text: "No")
          @option3 = @question.options.new(option_text: "Maybe")

          if @option1.valid? and @option2.valid? and @option3.valid? then
            @option1.save
            @option2.save
            @option3.save
          # else
          #   @parent_id =  params[:question][:parent_id]
          #   @url = project_questions_path
          #   render :new
          end
        end
        if params[:question][:parent_id].empty? then 
          flash[:success] = "Project question successfully created!"
          redirect_to project_questions_path
        else
          flash[:success] = "Child question successfully created!"
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
          flash[:success] = "Project question updated!"
          redirect_to project_question_path(id: @question.id)
      else
          @url = project_question_path
          render 'edit'
      end
    end
    

    def add_question 
      
      old_record = Question.find(params[:id])
      
      params[:project][:project_ids].each do |p|
          if p.empty? then 
          else
            
            new_record = old_record.dup
            new_record.project_id = p
            
            if new_record.save then
                  if old_record.options.present? then
                    old_record.options.each do |o|
                      new_option = o.dup
                      new_option.question_id = new_record.id
                      new_option.save 
                      # else
                      #   flash[:notice] = new_option.errors.full_messages
                      #   return redirect_to copy_question_path(project_id: params[:project_id])
                      # end
                    end
                  end
                  # if old_record.child_questions.present? then
                  #     old_record.child_questions.each do |q|
                  #       child = q.dup
                  #       child.parent_id = new_record.id
                  #       if child.save then 
                  #       else
                  #         flash[:notice] = child.errors.full_messages
                  #         return redirect_to copy_question_path(project_id: params[:project_id])
                  #       end
                  #       # if q.options.present? then
                  #       #   q.options.each do |o|
                  #       #   new_option = o.dup
                  #       #   new_option.question_id = child.id
                  #       #   if new_option.save then
                  #       #   else
                  #       #     flash[:notice] = new_option.errors.full_messages
                  #       #     return redirect_to copy_question_path(project_id: params[:project_id])
                  #       #   end
                  #       # end
                  #       # end
                  #   end
                  # end
            else 
              flash[:notice] = new_record.errors.full_messages
              return redirect_to copy_question_path(project_id: params[:project_id])
            end
          end
      end
      
      redirect_to project_question_path(id: params[:id])
      
    end
    
    def copy_question
      @user_projects = current_user.projects.where.not(id: params[:project_id])
      if @user_projects.empty?  
        flash[:notice] = "No other project to copy."
        @question = params[:id]
        redirect_to project_question_path(id: params[:id])
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
         params.require(:question).permit(:title, :description, :parent_id, :q_type, :term)
      end
end
