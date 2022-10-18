class ProjectSerializer < BaseSerializer
  attributes :id, :title, :short_description, :body, :image_url, :created_at
  belongs_to :project_type

  def short_description
    object.description
  end

  def image_url
    rails_blob_path(object.image , only_path: true)
  end

  def created_at
    object.created_at.strftime("%a ,%d %B %Y") 
  end

  def project_type
    object.project_type.title
  end
end
