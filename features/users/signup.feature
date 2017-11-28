Feature: New user has to be created
  As a user
  In order to create an account
  I should give credentials to create account
  
 Scenario: New user should be created
        
        When I go to "Sign up" page
        
        When I fill in  test values
      
        Then click "Sign up"
  
  