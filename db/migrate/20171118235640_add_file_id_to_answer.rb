class AddFileIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :file_id, :integer, array: true, default: []
  end
end
