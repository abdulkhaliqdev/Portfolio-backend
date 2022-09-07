class HomeController < ApplicationController
  def index
    @project = Project.all
    render json: {project: @project}, status: :ok
  end
end
