require 'spec_helper'
require 'rails_helper'
require 'faker'

describe ProjectsController do
 before(:each) do
     @user=FactoryGirl.create(:user)
     #controller.stub(:authenticate_user!).and_return(true)
    #controller.stub(:current_user).and_return(user)
    sign_in @user
     @services = FactoryGirl.create(:project)
     # user.projects.stub(:all).and_return(@services)
      @services.user_ids = @user.id
        @services.save
     end

 
 it "index action should be success" do
   get :index
   assert_response :success
 end
 describe "GET services" do
      before(:each) do
        get :index
      end

 it "homepage action should be success" do
   get :homepage
   assert_response :success
 end
 
 it "new action should be success" do
   get :new
   assert_response :success
 end

 it "renders the index template" do
      get :index
      expect(response).to render_template("index")
 end
 end 
  describe "GET index" do
    it "assigns @teams" do
      team = Project.create(:title => "Project1", :user_ids =>@user.id)
      get :index
       #expect(response).to redirect_to projects_path
      #expect(page).to have_content("Project1")
    end
end

it "creates project" do 
  project_params = FactoryGirl.attributes_for(:project)
  expect { post :create, :project => project_params }.to change(Project, :count).by(1) 
end

it "should respond with success" do
        response.should be_success
      end

context "with invalid attributes" do
    it "does not save the new project" do
        project_params = FactoryGirl.attributes_for(:invalid_project)
  expect { post :create, :project => project_params }.to_not change(Project, :count) 
      
    end

    it "re-renders the new method" do
        project_params = FactoryGirl.attributes_for(:invalid_project)
   post :create, :project => project_params
    expect(response).to render_template("new")
    end
  end 
  describe 'DELETE #destroy' do

  context "success" do

    it "deletes the project" do
    
         @project = Project.create(:title => "Projectdelete")
      expect{ 
        Project.destroy(@project) }.to change(Project, :count).by(-1)
    end

  end
   it "deletes the project and redirects" do
    
         @project = Project.create(:title => "Projectdelete")
         Project.destroy(@project) 
         expect(Project.all).not_to include @project
        
    end
    
  end
    describe 'show' do
        it "it renders the :show view if logged in as tamu user" do
            get :show, id: FactoryGirl.create(:project)
            expect(response).to render_template :show
        end
    end

describe 'PUT update' do
    it "located the requested @project" do
          put :update, id: @services, project: FactoryGirl.attributes_for(:project)
          expect(assigns(:project)).to eq(@services)
        end
        
end

end
