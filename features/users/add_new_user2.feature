Feature: New project has to be created
  As a user
  In order to create a project
  I should click on Create New Project
  
 Scenario: New project should be created
   
        When I login 
        #Then I should see "Signed in successfully."
        
        When I'm in  create projects page
        Then I should see "All Projects"
        Then I press on the new projects "CreateNewProject"
        Then I create new project title and description
        Then I click "Create Project"
        Then I click_link "something"
        Then I go to add users page
        Then I click_link "submit"
        #Then I should see "random"
        Then I click_link "Sign Out"
        
        
        When I go to "Sign up" page
        
        When I fill in  test values second
      
        Then click "Sign up"
        Then I click_link "Sign Out"
        
        When I login
        When I'm in  create projects page
        Then I should see "All Projects"
        Then I press on the new projects "CreateNewProject"
        Then I create new project title and description
        Then I click "Create Project"
        Then I click_link "something"
        Then I go to add users page