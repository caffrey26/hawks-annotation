require 'rails_helper'

RSpec.describe DownloadsController, type: :controller do
    before(:each) do
        @project = FactoryGirl.create(:project)
        @question1 = FactoryGirl.build(:question)
        @question1.project_id = @project.id
        @question1.save
        @option = FactoryGirl.build(:option)
        @option.question_id = @question1.id
        @option.save
    end
    
 describe "GET #index" do
    before { controller.stub(:current_user).and_return(FactoryGirl.create(:user)) }
      it "renders the :index view" do
        get :index, project_id: @project.id
        response.should render_template :index
      end
    end
    describe "GET #index latest" do
        before { controller.stub(:current_user).and_return(FactoryGirl.create(:user)) }
            it "renders the :index view" do
                get :index, project_id: @project.id, type: "latest"
            response.should redirect_to project_downloads_path(project_id: @project.id, format: "html")
            end
    end  
    describe "GET #index all" do
        before { controller.stub(:current_user).and_return(FactoryGirl.create(:user)) }
        it "renders the :index view" do
            get :index, project_id: @project.id, type: "all"
            response.should redirect_to project_downloads_path(project_id: @project.id, format: "html")
        end
    end  
    describe "GET #index own" do
        before { controller.stub(:current_user).and_return(FactoryGirl.create(:user)) }
        it "renders the :index view" do
            get :index, project_id: @project.id, type: "own"
            response.should redirect_to project_downloads_path(project_id: @project.id, format: "html")
        end
    end  
end
