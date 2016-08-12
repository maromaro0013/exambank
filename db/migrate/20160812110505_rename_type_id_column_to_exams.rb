class RenameTypeIdColumnToExams < ActiveRecord::Migration[5.0]
  def change
    rename_column :exams, :type_id, :exam_type_id
  end
end
