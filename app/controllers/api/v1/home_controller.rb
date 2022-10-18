class Api::V1::HomeController < Api::BaseController
  def index
    @projects = Project.all
    @articles = Article.all
    @user     = User.all
    return render json: {errors: 'There is no Project Yet'}, status: '401' if @projects.empty? 
    return render json: {errors: 'There is no Article Yet'}, status: '401' if @articles.empty? 
    render json: {
      user: ActiveModelSerializers::SerializableResource.new(@user, each_serializer: UserSerializer),
      projects: ActiveModelSerializers::SerializableResource.new(@projects, each_serializer: ProjectSerializer),
      articles: ActiveModelSerializers::SerializableResource.new(@articles, each_serializer: ArticleSerializer)
    }
  end
end
