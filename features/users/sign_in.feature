Feature: sign_in
  For the users to log in
  We want to have a page they can sign in from

    Scenario: User sees the sign in link
      When I go to the homepage
      Then I should see the sign in link
      
    # Scenario: User is not signed up
    #   When I do not exist as a user
    #   Then I see an invalid login message
        

    