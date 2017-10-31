class AddPFileToProjectFiles < ActiveRecord::Migration
  def change
    add_column :project_files, :p_file, :string
  end
end
