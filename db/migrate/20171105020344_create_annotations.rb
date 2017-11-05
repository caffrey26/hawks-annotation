class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :file_id
      t.string :text

      t.timestamps null: false
    end
  end
end
