require 'rails_helper'

RSpec.describe ProjectFilesController, type: :controller do
     before(:each) do
        @project = FactoryGirl.create(:project)
        @question1 = FactoryGirl.build(:question)
        @question1.project_id = @project.id
        @question1.save
        @option = FactoryGirl.build(:option)
        @option.question_id = @question1.id
        @option.save
        # @file = FactoryGirl.build(:file)
        # @file.project_id = @project.id
        # @file.save

    end
    describe "GET #index" do
      it "renders the :index view" do
        get :index, project_id: @project.id
        response.should render_template :index
      end
    end
    describe "GET #new" do
      it "renders the #new view" do
        get :new, project_id: @project.id
                 response.should render_template :new
        end
    end
    
     describe "GET #create" do
      it "creates files" do 
        file_params = FactoryGirl.attributes_for(:file)
       post :create, :project_file => file_params, :project_id => @project.id
        response.should render_template :new 
      end
      
       it "does not change count with invalid parameters" do 
        file_params = FactoryGirl.attributes_for(:file)
        expect { post :create, :project_file => file_params, :project_id => @project.id}.to change(ProjectFile, :count).by(0) 
      end
      end
    
    
end
