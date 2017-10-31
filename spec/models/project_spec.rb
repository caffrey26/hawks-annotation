require 'rails_helper'

RSpec.describe Project, type: :model do
    describe '#title' do
  
        it 'should validate presence' do
            record = Project.new
            record.title = '' # invalid state
            record.valid? # run validations
            record.errors[:title].should include("can't be blank") # check for presence of error
        end
    
    end
end
