class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def show
    @band = Band.new
    @bands = Band.all
    @user_id = current_user
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "user was succesfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :nickname, :phone, :address, :multimedia, :description, :looking_for_band, :skills, :style, :experience, profile_picture: [] )
  end

end
