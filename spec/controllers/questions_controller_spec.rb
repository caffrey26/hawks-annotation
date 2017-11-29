require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    before(:each) do
        @project = FactoryGirl.create(:project)
        @question1 = FactoryGirl.build(:question)
        @question1.project_id = @project.id
        @question1.save
    end
    describe "GET #index" do
    #   it "populates an array of contacts" do
    #     contact = Factory(:contact)
    #     get :index
    #     assigns(:questions).should eq()
    #   end
      
      it "renders the :index view" do
        get :index, project_id: @project.id
        response.should render_template :index
      end
    end
    
    describe "GET #show" do
    #   it "assigns the requested contact to @contact" do
    #     contact = Factory(:contact)
    #     get :show, id: contact
    #     assigns(:contact).should eq(contact)
    #   end
      
      it "renders the #show view" do
        get :show, id: @question1, project_id: @project.id
        response.should render_template :show
      end
    end
end

