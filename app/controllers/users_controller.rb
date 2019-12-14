class UsersController < ApplicationController
  before_action :skip_authorization

  def show
    @user = User.find(params[:id])
  end


end
