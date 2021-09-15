class Task < ApplicationRecord
  STATUSES = [:uncompleted, :completed, :archived]

  validates :title, presence: true
  validates :title, length: { maximum: 80 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :status, presence: true
  
  has_many :subtasks
  belongs_to :user, optional: true
  belongs_to :category, optional: true
end
