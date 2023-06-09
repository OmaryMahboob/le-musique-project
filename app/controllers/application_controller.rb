class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user_and_band

  def set_current_user_and_band
    @user = current_user
    if params[:query].present?
      sql_query1 = "band_name ILIKE :query"
      @bands_result = Band.where(sql_query1, query: "%#{params[:query]}%")
      @band_style_result = Band.joins(:styles).where("styles.style ILIKE ?", "%#{params[:query]}%")
      @bands = (@bands_result + @band_style_result).uniq

      sql_query2 = "nickname ILIKE :query OR full_name ILIKE :query"
      @users = User.where(sql_query2, query: "%#{params[:query]}%")
      @skill_result = User.joins(:skills).where("skills.skill ILIKE ?", "%#{params[:query]}%")
      @style_result = User.joins(:styles).where("styles.style ILIKE ?", "%#{params[:query]}%")
      @all_users = (@users + @skill_result + @style_result).uniq
    else
      @bands = Band.all
      @all_users = User.all.reject { |user| user == current_user}
    end
  end
end
