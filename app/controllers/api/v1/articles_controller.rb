class Api::V1::ArticlesController < Api::BaseController
  def index
    render json: articles, body: false
  end

  def show
    render json: article, body: true
  end

  private

  def articles
    @articles ||= Article.all
  end

  def article
    @article ||= Article.find_by!(id: params[:id])
  end
end
