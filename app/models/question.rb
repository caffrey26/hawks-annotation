class Question < ActiveRecord::Base
      belongs_to :project
      has_many :options
      has_many :answers
      has_many :child_questions, :class_name => "Question",
            :foreign_key => "parent_id"
      belongs_to :parent_question, :class_name => "Question"
      validates :title, presence: true, uniqueness: { scope: :project_id }
end