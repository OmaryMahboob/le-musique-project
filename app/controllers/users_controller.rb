class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @band = Band.new
    @bands = Band.all
    @current_user = current_user
    @user = User.find(params[:id])
    @owner = User.find(params[:id])
    @messages = Message.all
    @message = Message.new
    @chatroom = Chatroom.find_chat_room(current_user, @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:skills].present?
      @user.skills.destroy_all
      params[:user][:skills].each do |skill|
        skill_id = Skill.find_by(skill: skill).id
        UserSkill.create(user_id: @user.id, skill_id: skill_id)
      end
    end
    if params[:user][:styles].present?
      @user.styles.destroy_all
      params[:user][:styles].each do |style|
        # style_id = Style.find_by(style: style).id
        UserBandStyle.create(user_id: @user.id, style_id: style_id = Style.find_by(style: style).id)
      end
    end

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

  def band_params
    params.require(:user).permit(:id)
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :nickname, :phone, :address, :description, :looking_for_band,
                                 :experience, :profile_picture, multimedia: [])
  end
end
