FactoryGirl.define do
  factory :user do
    email "user@abc.com"
    password "password"
    password_confirmation "password"
  end
  
   factory :user1, parent: :user do
    email "user@abcd.com"
    password "password"
    password_confirmation "password"
  end
  
  factory :project do
    title { Faker::Name.title }
    description "project description"
    
  end

  factory :service do
    title { Faker::Name.title }
    description "project description1"
  end
  
  factory :invalid_project,parent: :project  do
    title nil
    description "project description1"
  end
  
  factory :option do
    option_text "option 1"
  end
  
  factory :file do
    file_name "file 1"
    project 1
  end
  end
