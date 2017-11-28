class AddQuestionIdToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :question_id, :integer
  end
end
