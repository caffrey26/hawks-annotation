
require 'rails_helper'

RSpec.describe Option, type: :model do
  subject { described_class.new(option_text: "some text", question_id: 2) }
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
     it "is not valid without a text" do
      subject.option_text = nil
      expect(subject).to_not be_valid
    end
end
  
end

