class Answer < ActiveRecord::Base
    # serialize :file_id, Array
    belongs_to :question
    
    CSV_HEADER = %w[question project user answer referenced_files created_at]

    def self.stitch_annotations(question_id, file_id)
      annotations_combined = Annotation.where(file_id: file_id).where(question_id: question_id).pluck(:text).join(' ~---~ ')
      if annotations_combined == ""
        annotations_combined
      else
        ProjectFile.find(file_id).file_name + ":{" + annotations_combined + "}"
      end
    end

    def self.stitch_references(question_id)
      file_ids = Reference.where(question_id: question_id).pluck(:file_id)
      refs_stitched = file_ids.map {|f|  self.stitch_annotations(question_id, f) }
      refs_stitched.join(', ')
    end

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
                    self.stitch_references(answer.question_id),
                    # Annotation.where(id: )
                    # ProjectFile.where(id: Reference.where(question_id: answer.question_id).pluck(:file_id)).pluck(:file_name).join(', '),
                    # Annotation.where(),
                    answer.created_at
                    ]
           end
        end
    end
end


       