class UserSerializer < BaseSerializer
  attributes :email, :about_me, :first_name, :last_name, 
                    :medium_profile_url, :linkedin_profile_url, :twitter_profile_url, 
                    :prime_image, :secondary_image, :third_image

  def prime_image
    rails_blob_path(object.prime_image , only_path: true)
  end

  def secondary_image
    rails_blob_path(object.secondary_image , only_path: true)
  end

  def third_image
    rails_blob_path(object.third_image , only_path: true)
  end
end
