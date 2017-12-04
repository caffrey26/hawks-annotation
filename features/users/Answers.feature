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
        Then I go to files page
        Then I should go to add a new file page
        Then I should fill in values
        Then I attach file "Attachment" to "/features/users/as.txt"
        Then I click_button "Create Project file"
        Then I go to questions page
        Then I click_button "Search"
        Then I go to add a new question page
        Then I give input question text
        Then I choose "Text-based free-form Answer"
        Then I click_button "Create Question"
        
        #Then I go to copy question page
        
        
        
        Then I go to Answers page
        Then I click_link "q12"
        #Then I should see "random"
        Then I click save answer
        Then I click on Add current reference to file
        
        