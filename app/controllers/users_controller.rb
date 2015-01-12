class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @interests =  @user.interests
  end
end