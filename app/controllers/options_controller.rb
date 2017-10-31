class OptionsController < ApplicationController
    def new
        @option = Option.new(question_id: params[:question_id])
        @url = project_question_options_path
        render html: "Under Constuction"
    end
end