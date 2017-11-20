require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new(title: "some_text", description: "some_textdescription") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it "is invalid with a duplicate title" do
        Question.create(title: "some_text", description: "some_textdescription")
       question=Question.new(title: "some_text", description: "some_textdescription") 
       question.valid?
       expect(question.errors[:title]).to include("has already been taken")
    end
end

end
