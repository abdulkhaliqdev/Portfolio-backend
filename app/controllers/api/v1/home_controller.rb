class Api::V1::HomeController < Api::BaseController
  def index
    render json: {
      projects: ActiveModelSerializers::SerializableResource.new(projects, each_serializer: ProjectSerializer, body: false),
      articles: ActiveModelSerializers::SerializableResource.new(articles, each_serializer: ArticleSerializer, body: false)
    }
  end

  private

  def projects
    @projects ||= Project.all.limit(4)
  end

  def articles
    @articles ||= Article.all.limit(4)
  end
end
