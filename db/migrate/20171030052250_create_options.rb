class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_text
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
