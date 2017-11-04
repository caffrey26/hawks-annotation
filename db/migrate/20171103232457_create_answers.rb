class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.[] :file_id
      t.string :answer_text
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
