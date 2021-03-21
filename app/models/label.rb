class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labelling, source: :task
end