class Project < ApplicationRecord
  belongs_to :user
  has_many :rewards

  validates :goal, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
