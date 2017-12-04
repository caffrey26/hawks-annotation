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
        Then I click_button "Search"
        Then I should go to add a new file page
        Then I should fill in values
        #Then I click_link "Attachment"
        Then I attach file "Attachment" to "/features/users/as.txt"
        #Then I should see "random"
        #Then I upload file
        Then I click_button "Create Project file"
        
        
        
        
        
        
        
        
        #Then I should see "random"
        Then I click_link "something1"
        Then I click_link "Edit"
        Then I should fill in values
        Then I attach file "Attachment" to "/features/users/as.txt"
        Then I click_button "Update Project file"
        Then I click_link "Back"
        Then I click_link "something1"
        Then I click_link "Delete"
         Then I should go to add a new file page
        Then I should fill in values
        #Then I click_link "Attachment"
        Then I attach file "Attachment" to "/features/users/as.txt"
        Then I click_button "Create Project file"
        
        
       
  
       # Then create new project name
    #    Then create description
        #Then click "Create Project"
        
        
        Then I go to files page
        Then I should go to add a new file page
        Then I should fill in values
        Then I attach file "Attachment" to "/features/users/as.txt"
        Then I click_button "Create Project file"