Feature: New project has to be created
  As a user
  In order to create a project
  I should click on Create New Project
  
 Scenario: New question should be created as Text as answer
   
        When I login 
        #Then I should see "Signed in successfully."
        
        When I'm in  create projects page
        Then I should see "All Projects"
        Then I press on the new projects "CreateNewProject"
        Then I create new project title and description
        Then I click "Create Project"
        Then I click_link "something"
        Then I go to questions page
        Then I click_button "Search"
        Then I go to add a new question page
        Then I give input question
        Then I choose "Text as Answer"
        Then I click_button "Create Question"
        Then I click_link "q1"
        Then I go to copy question page
        Then I click_button "submit"
        Then I go to Add child question page
        Then I click_button "Create Question"
        Then I go to options page
        Then I fill details
        Then I click_link "Create Option"
        
 Scenario: New question should be created as Text as answer
   
        When I login 
        #Then I should see "Signed in successfully."
        
        When I'm in  create projects page
        Then I should see "All Projects"
        Then I press on the new projects "CreateNewProject"
        Then I create new project title and description
        Then I click "Create Project"
        Then I click_link "something"
        Then I go to questions page
        Then I click_button "Search"
        Then I go to add a new question page
        Then I give input question
        Then I choose "Options as Answer"
        Then I click_button "Create Question"
        Then I click_link "q1"
        Then I go to copy question page
        Then I click_button "submit"
        Then I go to Add child question page
        Then I add values to child
        Then I click_button "Create Question"
        Then I click_link "Delete"
        
        