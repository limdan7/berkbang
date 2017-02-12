class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_rooms = @user.rooms.paginate(page: params[:page],per_page:5)
    @current_users_rooms = current_user.rooms
  end
end