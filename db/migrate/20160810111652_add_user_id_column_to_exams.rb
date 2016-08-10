class AddUserIdColumnToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :user_id, :integer, null:false
    add_column :exams, :type_id, :integer, null:false
  end
end
