class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 80 }
  validates :body, presence: true, length: { maximum: 500 }
  has_many :subtasks
  belongs_to :category, optional: true
end
