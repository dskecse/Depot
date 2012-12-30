class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.includes(:cart).page(params[:page]).per(10)
  end
end
