class Post < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true

end
