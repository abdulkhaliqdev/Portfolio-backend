class Api::V1::ProjectsController < Api::BaseController
  before_action :find_project, only: [:show]

  def index
    @projects = Project.all
    return render json: {errors: 'There is no Project Yet'}, status: '401' if @projects.empty?
    render json: @projects
  end

  def show
    render json: @project
  end

  private

  def find_project
    @project = Project.find_by!(id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "There is no Project yet."}, status: 404
  end
end
