require 'rails_helper'

RSpec.describe OptionsController, type: :controller do
before(:each) do
        @project = FactoryGirl.create(:project)
        @question1 = FactoryGirl.build(:question)
        @question1.project_id = @project.id
        @question1.save
        @question2 = FactoryGirl.build(:question1)
        @question2.project_id = @project.id
        @question2.save
        @option = FactoryGirl.build(:option)
        @option.question_id = @question2.id
        @option.save
    end
    
    
     describe "GET #new" do
      it "renders the #new view" do
        get :new, question_id: @question1.id, project_id: @project.id
          expect(assigns(:option)).to be_a_new(Option)      
        end
    end
     describe "GET #create" do
      it "creates options" do 
        option_params = FactoryGirl.attributes_for(:option)
        expect { post :create, :option => option_params, :project_id => @project.id,:question_id => @question1.id}.to change(Option, :count).by(1) 
      end
      
      it "does not change count with invalid parameters" do 
        option_params = FactoryGirl.attributes_for(:invalid_option1)
        expect { post :create, :option => option_params, :project_id => @project.id,:question_id => @question1.id}.to change(Option, :count).by(0) 
      end
      
      it "creates invalid question" do 
          option_params = FactoryGirl.attributes_for(:invalid_option1)
        post :create, :option => option_params, :project_id => @project.id,:question_id => @question1.id
           response.should render_template :new
      end
  end
   describe "GET #edit" do
      it "renders the #edit view" do
        get :edit, question_id: @question2.id, project_id: @project.id,id: @option.id
          response.should render_template :edit      
      end
    end
    describe "PUT update/:id" do
      let(:attr) do 
        { :option_text => 'new title', :question_id => @question2.id }
      end
    let(:attr1) do 
        { :option_text => nil, :question_id => @question2.id }
      end
      before(:each) do
        put :update, :project_id => @project.id,:question_id => @question2.id,:id => @option.id, :option => attr
        @option.reload
      end
    
      it { expect(response).to redirect_to project_question_path(id: @question2.id) }
      it { expect(@option.option_text).to eql attr[:option_text] }
      
      it "renders the #edit view" do
            put :update, :project_id => @project.id,:question_id => @question2.id,:id => @option.id, :option => attr1
        @option.reload
          response.should render_template :edit      
      end
  end
    describe 'DELETE #destroy' do
    context "success" do
       it "deletes the option" do
          expect{ 
            delete :destroy, project_id: @project.id, question_id: @question1.id, id: @option.id
         }.to change(Option, :count).by(-1)
        end
      end
end
end
