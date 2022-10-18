class ArticleSerializer < BaseSerializer
  attributes :id, :title, :project_type, :short_description, :body, :main_image_url, :image_gallery_urls, :created_at

  def short_description
    object.description
  end

  def main_image_url
    rails_blob_path(object.main_image , only_path: true)
  end
  
  def image_gallery_urls
    object.image_gallery.map do |image|
      rails_blob_path(image , only_path: true)
    end
  end

  def created_at
    object.created_at.strftime("%a ,%d %B %Y") 
  end

  def project_type
    object.project_type.title
  end
end
