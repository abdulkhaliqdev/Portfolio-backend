class ProjectSerializer < BaseSerializer
  attributes :id, :title, :type, :short_description, :image_url, :created_at

  attribute  :body, if: :include_body?

  def short_description
    object.description
  end

  def image_url
    "#{Rails.application.default_url_options[:host]}#{rails_blob_path(object&.image , only_path: true)}"
  end

  def created_at
    object.created_at.strftime("%a ,%d %B %Y")
  end
end
