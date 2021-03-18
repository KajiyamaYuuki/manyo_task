class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  enum priority: {
    選択なし: 0,
    低: 1,
    中: 2,
    高: 3
  }
  scope :search_title_status, -> (title, status) do
    where('title LIKE ?', "%#{title}%").where(status: status)
  end
  scope :search_title, -> (title) do
    where('title LIKE ?', "%#{title}%")
  end
  scope :search_status, -> (status) do
    where(status: status)
  end
end
