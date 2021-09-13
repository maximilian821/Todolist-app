class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :body, presence: true
  has_many :subtasks
  belongs_to :category, optional: true
end
