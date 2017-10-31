class AddUploadedfileToProjectFiles < ActiveRecord::Migration
  def change
    add_column :project_files, :uploadedfile, :string
  end
end
