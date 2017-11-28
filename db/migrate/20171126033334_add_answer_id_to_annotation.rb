class AddAnswerIdToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :answer_id, :integer
  end
end
