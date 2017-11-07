def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the sign in link$/) do
  expect(page).to have_content("Sign in")
end

# When(/^I do not exist as a user$/) do
#   visit root_path
# end

# Then(/^I should see the sign in link$/) do
#   expect(page).to have_content("Sign in")
# end

Given("I'm on homepage") do
  visit root_path
end

Then("I click  {string}") do |string|
  click_link(string)
end

Then("I should be on the Sign up page.") do
  visit '/users/sign_up'
end

When("I go to {string} page") do |string|
  visit '/users/sign_up'
end

When("I fill in  test values") do
  visit '/users/sign_up'
  fill_in 'Email', :with => 'efg@hgj.com'
  fill_in("Password", with: '123456', :match => :prefer_exact)
  fill_in("Password confirmation", with: '123456', :match => :prefer_exact)
 
end

Then("click {string}") do |string|
  click_button(string)
    
end


When("I'm in  create projects page") do
  visit '/projects'
  
  
end

Then("create new project name") do
  visit '/projects'
  
  fill_in 'something', :with => 'efg@hgj.com'
  
end

Then("create description") do
  fill_in 'Description', :with => 'This is the description of the project'
end

When("I login") do
  visit '/users/sign_up'
  expect(page).to have_content("Password confirmation")
  
  fill_in("Email", with: 'abh@gmail.com', :match => :prefer_exact)
  fill_in("Password", with: '12345678', :match => :prefer_exact)
  fill_in("Password confirmation", with: '12345678', :match => :prefer_exact)
  click_button("Sign up")
  expect(page).to have_content("Welcome! You have signed up successfully.")
  
  
  #visit '/users/sign_in'
  #fill_in("Email", with: 'abh@gmail.com', :match => :prefer_exact)
  #fill_in("Password", with: '12345678', :match => :prefer_exact)
  #click_button("Sign in")
  
  
end
 Then("press {string}") do |string|
  click_link(string)
end

When("I'm in create new project page") do
  visit '/projects/'
  click_link("Hello")
end

Then("I press on {string}") do |string|
  click_link(string)
end

Then("I press on the new projects {string}") do |string|
  #click_button(string)
  visit '/projects/new'
end

Then("I should see {string}") do |string|
  expect(page).to have_content(string)
end

Then("I create new project title and description") do
  fill_in("Project", with: 'something', :match => :prefer_exact)
  fill_in("Description", with: 'this is the description', :match => :prefer_exact)
end

When("I go to login page") do
  visit '/users/sign_in'
end

When("I press {string}") do |string|
  click_link(string)
end

Then("I should go to Forgot password page") do
  visit '/users/password/new'
end

Then("I should give Mail ID to get reset password") do
  fill_in("Email", with: 'test@test.com', :match => :prefer_exact)
end

Then("I click {string}") do |string|
  click_button(string)
end

