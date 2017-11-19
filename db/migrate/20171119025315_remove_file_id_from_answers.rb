class RemoveFileIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :file_id, :integer
  end
end
