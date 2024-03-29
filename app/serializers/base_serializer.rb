class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def type
    object.project_type.title
  end

  def include_body?
    @instance_options[:body]
  end
end
