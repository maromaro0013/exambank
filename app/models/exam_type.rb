class ExamType < ActiveHash::Base
  include ActiveHash::Enum
  self.data = [
    { id: 10, label: 'single_select', name:'単一選択式' },
    { id: 20, label: 'multiple_select', name:'複数選択式' }
  ]
  enum_accessor :label
end
