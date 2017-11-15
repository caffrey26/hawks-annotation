
class Option < ActiveRecord::Base
    belongs_to :question
    validates :option_text, presence: true, uniqueness: { scope: :question_id }
end
