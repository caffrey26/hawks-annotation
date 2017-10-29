class FixColName < ActiveRecord::Migration
  def change
    rename_column :projects, :user_id, :admin_id
  end
end
