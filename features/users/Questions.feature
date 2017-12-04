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
        Then I click_link "q12"
        #Then I go to copy question page
        Then I click_link "Copy Question"
        
        Then I click_link "Add Child Question"
        Then I add values to child
        Then I click_button "Create Question"
        
        
        
        Then I click_link "Add Child Question"
        Then I add values to child page
        Then I choose "Text-based free-form Answer"
        Then I click_button "Create Question"
        
        
        
        
        
 Scenario: New question should be created as Create Custom Options
   
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
        Then I go to files page
        Then I should go to add a new file page
        Then I should fill in values
        Then I attach file "Attachment" to "/features/users/as.txt"
        Then I click_button "Create Project file"
        Then I go to add a new question page
        Then I give input question custom
        Then I choose "Create Custom Options"
        Then I click_button "Create Question"
        Then I click_link "q2"
        Then I click_link "Add Options"
        Then I fill values
        Then I click_button "Create Option"
        
        Then I go to edit custom page
        Then I click_button "Update Option"
        
       
        
        
        Then I click_link "Copy Question"
        
        
        Then I click_link "Add Child Question"
        Then I fill in the details
        Then I choose "Text-based free-form Answer"
        Then I click_button "Create Question"
        
        Then I click_link "Add Child Question"
        Then I fill in the details
        Then I choose "Template: True/False"
        Then I click_button "Create Question"
        
        Scenario: New question should be created as Template: True/False
   
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
        Then I give input question options one
        Then I choose "Template: True/False"
        Then I click_button "Create Question"
        Then I click_link "q3"
        
        
        
        Then I go to edit page
        Then I fill in edit values
        Then I choose "Template: True/False"
        Then I click_button "Update Question"
        
        Then I go to other edit page
        Then I click_button "Update Option"
        
        Then I click_link "Add Child Question"
        Then I fill in the details
        Then I choose "Text-based free-form Answer"
        Then I click_button "Create Question"
        
        Then I click_link "Add Child Question"
        Then I fill in the details
        Then I choose "Template: True/False"
        Then I click_button "Create Question"
        
        
        
        
        Scenario: New question should be created as Template: Yes/No/Maybe
   
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
        Then I give input question options two
        Then I choose "Template: Yes/No/Maybe"
        Then I click_button "Create Question"
        Then I click_link "q4"
        Then I go to remove page
        Then I click_button "Update Option"
        Then I click_link "Delete"
        
        
       
        
        
        
        
        