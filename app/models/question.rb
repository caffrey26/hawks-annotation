class Question < ActiveRecord::Base
      belongs_to :project
      validates :title, presence: true, uniqueness: true
      has_many :options
end
