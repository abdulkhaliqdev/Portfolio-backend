class ArticleSerializer < BaseSerializer
  attributes :id, :title, :type, :short_description, :image_url, :image_gallery_urls, :created_at

  attribute  :body, if: :include_body?

  def short_description
    object.description
  end

  def image_url
    "#{Rails.application.default_url_options[:host]}#{rails_blob_path(object&.main_image , only_path: true)}"
  end

  def image_gallery_urls
    object.image_gallery.map { |image| "#{Rails.application.default_url_options[:host]}#{rails_blob_path(image , only_path: true)}" }
  end

  def created_at
    object.created_at.strftime("%a ,%d %B %Y") 
  end
end
