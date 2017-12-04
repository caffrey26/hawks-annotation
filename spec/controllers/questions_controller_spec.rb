require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
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
      it "renders the :index view" do
        get :index, project_id: @project.id
        response.should render_template :index
      end
    end
    
    describe "GET #show" do
      it "renders the #show view" do
        get :show, id: @question1, project_id: @project.id
        response.should render_template :show
      end
    end
    
    describe "GET #new" do
      it "renders the #new view" do
        get :new, project_id: @project.id
          expect(assigns(:question)).to be_a_new(Question)      
        end
    end
    describe "GET #create" do
      it "creates question with TF template" do 
        question_params = FactoryGirl.attributes_for(:question)
        expect { post :create, :question => question_params, :project_id => @project.id}.to change(Question, :count).by(1) 
      end
      it "creates question with YN template" do 
        question_params = FactoryGirl.attributes_for(:question1)
        expect { post :create, :question => question_params, :project_id => @project.id}.to change(Question, :count).by(1) 
      end
      it "creates invalid question with YN template" do 
        question_params = FactoryGirl.attributes_for(:question1)
        expect { post :create, :question => question_params, :project_id => @project.id}.to change(Question, :count).by(1) 
        
      end
      it "creates child question" do 
        question_params = FactoryGirl.attributes_for(:child_question)
        expect { post :create, :question => question_params, :project_id => @project.id}.to change(Question, :count).by(1) 
      end
      it "creates invalid question" do 
        question_params = FactoryGirl.attributes_for(:question)
        expect { post :create, :question => question_params, :project_id => @project.id}.to change(Question, :count).by(1) 
        post :create, :question => question_params, :project_id => @project.id
           response.should render_template :new
      end
    end
    
    describe "GET #edit" do
      it "renders the #edit view" do
        get :edit, project_id: @project.id, id: @question1.id
          response.should render_template :edit      
      end
    end
    describe "PUT update/:id" do
      let(:attr) do 
        { :title => 'new title', :description => 'new content' }
      end
    
      before(:each) do
        put :update, :project_id => @project.id,:id => @question1.id, :question => attr
        @question1.reload
      end
    
      it { expect(response).to redirect_to project_question_path(id: @question1.id) }
      it { expect(@question1.title).to eql attr[:title] }
      it { expect(@question1.description).to eql attr[:description] }
  end
  
  describe "POST #add_question" do
    it "adds question" do
      post :add_question, project_id: @project.id, id: @question1.id, project: {project_ids: {}}
        expect(response).to redirect_to  project_question_path(id: @question1.id)
    end
    it "clone question with options" do
      post :add_question, project_id: @project.id, id: @question1.id, project: {project_ids: {a: 1}}
        expect(response).to redirect_to  project_question_path(id: @question1.id)
    end
  end
  
  describe "POST #copy_question" do
    before { controller.stub(:current_user).and_return(FactoryGirl.create(:user)) }
    it "renders the copy question view" do
      get :copy_question, project_id: @project.id, id: @question1.id
          response.should redirect_to project_question_path(id: @question1.id)
    end
  end
  describe 'DELETE #destroy' do
    context "success" do
       it "deletes the question" do
          expect{ 
            delete :destroy, project_id: @project.id, id: @question1.id
         }.to change(Question, :count).by(-1)
        end
      end
    end
    describe 'find question #find_question' do
      before {get :show, id: @question1, project_id: @project.id}
          it { expect(controller.find_question.id).to eql @question1.id}
      end
end

