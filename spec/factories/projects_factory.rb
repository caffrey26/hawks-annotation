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
  factory :question do
    title { Faker::Name.title }
    parent_id ""
    description "question description"
    q_type "TF"
  end
  factory :question1, parent: :question do
    title { Faker::Name.title }
    parent_id ""
    description "question description"
    q_type "YN"
  end
  factory :child_question, parent: :question do
    title { Faker::Name.title }
    parent_id 1
    description "question description"
    q_type "YN"
  end
  factory :invalid_question, parent: :question do
    
    invalid_option
    id 10000
    title { Faker::Name.title }
    parent_id ""
    description "question description"
    q_type "YN"
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
    question_id 10000
  end
  factory :answer do
    answer_text "Answer test"  
  end
  factory :invalid_option, parent: :option do
    option_text "Yes"
  end
  factory :file do
    file_name "file 1"
    project 1
  end
  end
