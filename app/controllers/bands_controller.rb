class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def new
    @band = Band.new
    @bands = Band.all
    @band.user = current_user
    @user = current_user
  end

  def index
    if params[:query].present?
      # sql_query = "band_name ILIKE :query OR style ILIKE :query"
      sql_query = "band_name ILIKE :query"
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
    @band = Band.find(params[:id])
    @user = @band.user
    @my_bands = @band.band_members
    # @band_where_member = BandMember.where(user_id: params[:user_id], band_id: params[:id])
    @owner = User.find(params[:user_id])
    @current_user = current_user
  end

  def create
    @user = current_user
    @band = Band.new(band_params)
    @band.user_id = current_user.id

    if params[:band][:styles].present?
      params[:band][:styles].each do |style|
        new_style = Style.find_by(style: [style])
        UserBandStyle.create(band: @band, style: new_style)
      end
    end

    if @band.save
      redirect_to user_path(id: current_user.id)
    else
      render "bands/show", status: :unprocessable_entity
    end
  end

  def update
    if params[:band][:styles].present?
      @band.styles.destroy_all
      params[:band][:styles].each do |s|
        new_style = Style.find_by(style: [s])
        UserBandStyle.create(band: @band, style: new_style)
      end
    end

    @band.update(band_params)
    redirect_to user_path(id: current_user.id), notice: "Band was successfully updated."
  end

  def destroy
    @band.destroy
    redirect_to user_path(id: current_user.id), notice: "Band was successfully deleted."
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:band_name, :looking_for_member, :experience, :content, :city,
                                  multimedia: [])
  end
end
