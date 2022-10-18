class User < ApplicationRecord
  has_one_attached  :prime_image
  has_one_attached  :secondary_image
  has_one_attached  :third_image
end
