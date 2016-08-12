class AddContentColumnToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :content, :text, limit: 65000
  end
end
