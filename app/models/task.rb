class Task < ApplicationRecord
  STATUSES = [:uncompleted, :completed]

  validates :title, presence: true
  validates :title, length: { maximum: 80 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :status, presence: true
  
  has_many :subtasks
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  scope :not_archived, ->() { where(archived: false) }
  scope :only_archived, ->() { where(archived: true) }

  def self.archived?
    archived
  end
end
