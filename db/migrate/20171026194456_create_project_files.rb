class CreateProjectFiles < ActiveRecord::Migration
  def change
    create_table :project_files do |t|
      t.string :file_name
      t.string :description
      t.references :project
      
      t.timestamps null: false
    end
  end
end
