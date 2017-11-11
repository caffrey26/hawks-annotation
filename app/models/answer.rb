class Answer < ActiveRecord::Base
    belongs_to :question
    has_many :files

    def self.to_csv
        attributes = %w[id question_id q_type answer_text project_id user_id title ]
        CSV.generate(headers: true) do |csv|
           csv << attributes

           all.each do |answer|
               csv << answer.attributes.values_at(*attributes)
           end
        end
    end
end
