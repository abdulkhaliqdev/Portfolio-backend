class Api::V1::ProjectsController < Api::BaseController
  def index
    render json: projects
  end

  def show
    render json: project
  end

  private

  def projects
    @project ||= Project.all
  end

  def project
    @project ||= Project.find_by!(id: params[:id])
  end
end
