class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_rooms = @user.rooms.paginate(page: params[:page],per_page:5)
    @user_demand = @user.demands.all
    @current_users_rooms = current_user.rooms
    @current_users_demands = current_user.demands
  end
end