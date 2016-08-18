class Exam < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :exam_type

  belongs_to :user
  has_many :exam_choise_selects

  def create_choise_select(text, is_correct)
    choice = ExamChoiseSelect.new(exam_id: self.id, text: text, is_correct: is_correct)
    choice.save
  end
end
