class AddUserIdToUserProject < ActiveRecord::Migration
  def change
    add_column :user_projects, :user_id, :number
  end
end
