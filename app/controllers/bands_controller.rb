class BandsController < ApplicationController

  def new
    @band = Band.new
    @band.user = current_user
    @user = current_user
  end

  def index
    if params[:query].present?
      sql_query = "band_name ILIKE :query OR style ILIKE :query"
      @bands = Band.where(sql_query, query: "%#{params[:query]}%")
    else
      @bands = Band.all
    end
    @user = current_user
  end

  def edit
    @user = current_user
    @band = Band.find(params[:id])
  end

  def show
    @user_id = current_user
    @band = Band.find(params[:id])
  end

  def create
    @user = current_user
    @band = @user.bands.build(band_params)

    if @band.save
      redirect_to user_path(id: current_user.id)
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def update
    set_band
    @band.update(band_params)
  end

  def destroy
    set_band
    @band.destroy
    redirect_to user_path(id: current_user.id), notice: "Band was successfully deleted."

  end



  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:band_name, :band_style, :looking_for_member, :multimedia, :experience, :content, :city)
  end
end
