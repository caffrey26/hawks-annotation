class Answer < ActiveRecord::Base
    # serialize :file_id, Array
    belongs_to :question
    
    CSV_HEADER = %w[question project user answer referenced_files created_at]

    def self.to_csv
        # attributes = %w[ question question_id q_type answer_text project_id user_id title ]
        CSV.generate(headers: true) do |csv|
        #   csv << attributes
            csv << CSV_HEADER


           all.each do |answer|
            #   csv << answer.attributes.values_at(*attributes)
            csv <<  [
                    answer.question.title, 
                    answer.question.project.title,
                    User.find(answer.user_id).email,
                    if answer.question.q_type == 'T' then answer.answer_text else answer.question.options.find(answer.answer_text).option_text end,
                    ProjectFile.where(id: Reference.where(question_id: answer.question_id).pluck(:file_id)).pluck(:file_name).join(', '),
                    # Annotation.where(),
                    answer.created_at
                    ]
           end
        end
    end
end


       