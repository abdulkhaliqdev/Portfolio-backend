class Api::V1::ArticlesController < Api::BaseController
  before_action :find_article, only: [:show]

  def index
    @articles = Article.all
    return render json: {errors: 'There is no Project Yet'}, status: '401' if @articles.empty?
    render json: @articles
  end

  def show
    render json: @article
  end

  private

  def find_article
    @article = Article.find_by!(id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "There is no Article yet."}, status: 404
  end
end
