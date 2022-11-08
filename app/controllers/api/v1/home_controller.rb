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
    @projects ||= Project.all.limit(4)
  end

  def articles
    @articles ||= Article.all.limit(4)
  end

  def user
    @user ||= User.first
  end
end
