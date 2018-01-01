class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
    # rooms = tout les annonces de l'utilisateurs
  end
end
