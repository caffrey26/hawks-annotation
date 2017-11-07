require 'rails_helper'

RSpec.describe User, :type => :model do
 
 subject { described_class.new(password: "some_password", email: "john@doe.com") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    
    it "is invalid with a duplicate address" do
        User.create(password: "some_password", email: "john@doe.com")
       user=User.new(password: "some_password", email: "john@doe.com") 
       user.valid?
       expect(user.errors[:email]).to include("has already been taken")
    end
    
  end
end