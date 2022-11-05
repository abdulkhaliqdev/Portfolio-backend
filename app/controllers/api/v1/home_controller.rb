class Api::V1::HomeController < Api::BaseController
  def index
    render json: {
      user: ActiveModelSerializers::SerializableResource.new(user, each_serializer: UserSerializer),
      projects: ActiveModelSerializers::SerializableResource.new(projects, each_serializer: ProjectSerializer),
      articles: ActiveModelSerializers::SerializableResource.new(articles, each_serializer: ArticleSerializer)
    }
  end

  private

  def projects
    @projects ||= Project.eager_load(:image_attachment).limit(4)
  end

  def articles
    @articles ||= Article.eager_load(:main_image_attachment, :image_gallery_attachments).limit(4)
  end

  def user
    @user ||= User.eager_load(:prime_image_attachment, :secondary_image_attachment, :third_image_attachment).first
  end
end
