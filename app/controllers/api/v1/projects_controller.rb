class Api::V1::ProjectsController < Api::BaseController
  def index
    render json: projects, body: false
  end

  def show
    render json: project, body: true
  end

  private

  def projects
    @project ||= Project.all
  end

  def project
    @project ||= Project.find_by!(id: params[:id])
  end
end
