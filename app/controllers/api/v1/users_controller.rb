class Api::V1::UsersController < Api::BaseController
  def index
    render json: users
  end

  private

  def users
    @users ||= User.first
  end
end
