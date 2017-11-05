class AddParentIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :parent_id, :integer
  end
end
