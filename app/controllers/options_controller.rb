class OptionsController < ApplicationController
    def new
        abc
        @option = option.new(project_id: params[:project_id])
        @url = project_Options_path
    end
end
