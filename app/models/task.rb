class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum priority: {
    選択なし: 0,
    高: 1,
    中: 2,
    低: 3
  }
end
