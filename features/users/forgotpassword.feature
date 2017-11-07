Feature: User should be able to
  Reset his account
  If he forgets his password
  
Scenario: 
  
  When I go to login page
  When I press "Forgot your password?"
  Then I should go to Forgot password page
  Then I should give Mail ID to get reset password
  Then I click "Send me reset password instructions"