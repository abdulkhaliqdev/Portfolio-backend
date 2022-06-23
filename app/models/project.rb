class Project < ApplicationRecord
  belongs_to :project_type

  has_one_attached  :image

  validates :title, :description, :body, :project_type, presence: true
end
