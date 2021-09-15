class Category < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :nullify
  belongs_to :user, optional: true
end
