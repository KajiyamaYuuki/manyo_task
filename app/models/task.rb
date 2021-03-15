class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum priority: {
    選択なし: 0,
    低: 1,
    中: 2,
    高: 3
  }
end
