class CreateExamChoiseSelects < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_choise_selects do |t|
      t.integer :exam_id, null: false
      t.string :text, limit: 250, null: false
      t.boolean :is_correct, default: false, null: false

      t.timestamps
    end
  end
end
