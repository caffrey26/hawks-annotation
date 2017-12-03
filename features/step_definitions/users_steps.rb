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

When("I fill in  test values again") do
  
  fill_in("Email", with: 'abhi2@gmail.com', :match => :prefer_exact)
  fill_in("Password", with: '12345678', :match => :prefer_exact)
  fill_in("Password confirmation", with: '12345678', :match => :prefer_exact)
  
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
  #expect(page).to have_content("Password confirmation")
  
  fill_in("Email", with: 'abhi@gmail.com', :match => :prefer_exact)
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

Then("I click {string}") do |string|
  click_button(string)
end

When("I click on All Projects") do
  visit '/projects'
end



Then("I click on {string}") do |string|
  click_button(string)
end

Then("I create new project title and description second") do
  fill_in("Project", with: 'somethings', :match => :prefer_exact)
  fill_in("Description", with: 'this is the description', :match => :prefer_exact)
end

Then("I click_link {string}") do |string|
  click_link(string)
end

Then("I click_button {string}") do |string|
  click_button(string)
end

Then("I update values") do
  fill_in("Project", with: 'something', :match => :prefer_exact)
  fill_in("Description", with: 'this is the description', :match => :prefer_exact)
end

Then("I go to files page") do
  visit '/projects/1/project_files'
end

Then("I go to questions page") do
  visit '/projects/1/questions'
end

Then("I go to add new user page") do
  visit '/projects/1/show_and_select_user'
end

Then("I go to Answers page") do
  visit '/projects/1/answers'
end

Then("I go to downloads page") do
  visit '/projects/1/downloads'
end

Then("I should go to add a new file page") do
  visit '/projects/1/project_files/new'
end

Then("I should fill in values") do
  fill_in("Name of the File", with: 'something', :match => :prefer_exact)
  
end

Then("I go to add a new question page") do
  visit 'questions/new'
end

Then("I give input question") do
  fill_in("Question Title", with: 'q1', :match => :prefer_exact)
end

Then("I choose {string}") do |string|
  choose(string)
end

Then("I go to copy question page") do
  visit '/projects/1/questions/1/copy_question'
end

Then("I go to Add child question page") do
  visit '/projects/1/questions/new?parent_id=1'
end
Then("I add values to child") do
  fill_in("Question Title", with: 'cq1', :match => :prefer_exact)
end

Then("I add values to child page") do
  fill_in("Question Title", with: 'cq11', :match => :prefer_exact)
end

Then("I give input question text") do
  fill_in("Question Title", with: 'q12', :match => :prefer_exact)
end

Then("I give input question custom") do
  fill_in("Question Title", with: 'q2', :match => :prefer_exact)
end

Then("I give input question options one") do
  fill_in("Question Title", with: 'q3', :match => :prefer_exact)
end

Then("I give input question options two") do
  fill_in("Question Title", with: 'q4', :match => :prefer_exact)
end

Then("I attach {string}") do |string|
  attach_file('string', File.absolute_path('./features/users/as.txt'))
 # page.attach_file "string", ['/hawks_annotation/features/users/as.txt']
end

Then("I sign out") do
  visit '/'
end

Then("I go to options page") do
  visit '/projects/1/questions/1/options/new'
end


Then("I fill details") do
  fill_in("Option", with: 'option1', :match => :prefer_exact)
end

Then("I fill values") do
  fill_in("Option", with: 'option1', :match => :prefer_exact)
end

Then("I fill child details options") do
  fill_in("Question Title", with: 'option2child', :match => :prefer_exact)
end

Then("I fill in the details") do
  fill_in("Question Title", with: 'option2child', :match => :prefer_exact)
end

Then("I click on Save Answer") do
  
  click_button(class: 'btn btn-default btn btn-primary btn-sm')
end



Then("I click on Add current reference to file") do
  click_button(class: 'btn btn-primary btn-sm')
end

Then("I download Latest Answers") do
  visit 'downloads.csv?type=latest'
end

Then("I download All Answers") do
  visit 'downloads.csv?type=all'
end

Then("I download Own Answers") do
  visit 'downloads.csv?type=own'
end