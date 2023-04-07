class BandsController < ApplicationController

  def new
    @band = Band.new
    @bands = Band.all
    @band.user = current_user
    @user = current_user
  end

  def index
    @user = current_user
    @bands = Band.all
  end

  def edit
    @user = current_user
    @band = Band.find(params[:id])

  end


  def show
    # @user_id = current_user
    @band = Band.find(params[:id])
    @user = @band.user
    @band_members = BandMember.all
    @owner = User.find(params[:user_id])
    @current_user = current_user
  end

  def create
    @user = current_user
    @band = @user.bands.new(band_params)
    @band.user_id = current_user.id

    if @band.save
      redirect_to user_path(id: current_user.id)
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  def update
    set_band
    @band.update(band_params)
    redirect_to user_path(id: current_user.id), notice: "Band was successfully updated."
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
    params.require(:band).permit(:band_name, :band_style, :looking_for_member, :experience, :content, :city,
                                  multimedia: [])
  end
end
