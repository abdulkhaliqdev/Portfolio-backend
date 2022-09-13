class HomeController < ApplicationController
  def index
    @projects = Project.all
    return render json: {errors: 'There is no Project Yet'}, status: '401' if @projects.empty?
    render json: @projects
  end
end
