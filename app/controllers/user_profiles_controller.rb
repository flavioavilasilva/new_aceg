class UserProfilesController < ApplicationController
  def show
    @user = User.find params[:id]
    @adoptions = @user.adoptions.where(status: 0)
  end
end
