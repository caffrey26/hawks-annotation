class AddDataToReferences < ActiveRecord::Migration
  def change
    add_column :references, :question_id, :integer
    add_column :references, :answer_id, :integer
    add_column :references, :file_id, :integer
    add_column :references, :user_id, :integer
  end
end
