class Reward < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

end
