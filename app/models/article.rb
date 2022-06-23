class Article < ApplicationRecord
  belongs_to :project_type

  has_one_attached :main_image
end
