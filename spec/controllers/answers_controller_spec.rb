require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
before(:each) do
        @project = FactoryGirl.create(:project)
        @question1 = FactoryGirl.build(:question)
        @question1.project_id = @project.id
        @question1.save
        @option = FactoryGirl.build(:option)
        @option.question_id = @question1.id
        @option.save
        @answer = FactoryGirl.create(:answer)
    end
    describe "GET #index" do
      it "renders the :index view" do
        get :index, project_id: @project.id
        response.should render_template :index
      end
    end
    describe "GET #create" do
      it "creates answers" do 
        answer_params = FactoryGirl.attributes_for(:answer)
        expect { post :create, :answer => answer_params, :project_id => @project.id, :question_id => @question1.id, :id => "-1",  format: :js}.to change(Answer, :count).by(1) 
      end
      it "updates answers" do 
        answer_params = FactoryGirl.attributes_for(:answer)
        expect { post :create, :answer => answer_params, :project_id => @project.id, :question_id => @question1.id, :id => @answer.id,  format: :js}.to change(Answer, :count).by(0) 
      end
    end
end