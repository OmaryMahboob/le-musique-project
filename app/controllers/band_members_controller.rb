class BandMembersController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @band_members = BandMember.all
    @user = User.find(params[:user_id])
  end

  def new
    @band_member = BandMember.new
  #  @band.id = Band.find(params[:id])
    create
  end

  def create
    @band_member = BandMember.new
    @band = Band.find(params[:band_id])
    @band_member.band = @band
    @band_member.user = current_user
    @band_member.approved = false
    if @band_member.save
      flash[:notice] = "your request is sent to the band owner for approval."
      redirect_to user_band_band_member_path(user_id: @band.user_id, id: @band.id)
    else
      flash[:alert] = "you have already submited your request to join this band."
      redirect_to user_band_band_member_path(user_id: @band.user_id, id: @band.id)
    end

  end

  def destroy
    @band_member = BandMember.find(params[:id])
    @band_member.destroy(band_member_params)
    redirect_to user_band_band_member_path(user_id: @band.user_id, band_id: @band.id, id:@band_member.id), notice: "You have succesfully left this band."
  end

  def show
    @band_member = BandMember.find(params[:id])
  end

  private
  def band_member_params
    params.require(:band_member).permit(:user_id, :band_id, :id)
  end
end
