class Article < ApplicationRecord
  belongs_to :project_type

  has_one_attached :main_image
  has_many_attached :image_gallery
end
