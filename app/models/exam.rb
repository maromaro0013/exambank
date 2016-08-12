class Exam < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :exam_type

  belongs_to :user
end
