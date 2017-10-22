class UsersController < ApplicationController
    
 
   def show_and_select_user
          @users = User.all
        #   @welcome = "Welcome to Hawks Annotation! Sign in or sign up to continue"
   end
    
end
