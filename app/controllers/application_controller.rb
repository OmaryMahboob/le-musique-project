class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user_and_band

  def set_current_user_and_band
    @user = current_user
    if params[:query].present?
      sql_query1 = "band_name ILIKE :query"
      @bands = Band.where(sql_query1, query: "%#{params[:query]}%")
      sql_query2 = "nickname ILIKE :query OR full_name ILIKE :query"
      @users = User.where(sql_query2, query: "%#{params[:query]}%")
      @user_result = User.joins(:skills).where("skills.skill ILIKE ?", "%#{params[:query]}%")
      @all_users = (@users + @user_result).uniq
    else
      @bands = Band.all
      @all_users = User.all
    end
  end
end
