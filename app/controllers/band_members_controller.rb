class BandMembersController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @band_members = @band.band_members
    @user = User.find(params[:user_id])
  end

  def update
    @band_member = BandMember.find(params[:id])
    @band_member.update(approved: true)
    @band = Band.find(params[:band_id])
    redirect_to user_band_path(@band.user.id, @band), notice: "Request to join band is approved."
  end

  def create
    @band_member = BandMember.new
    @band = Band.find(params[:band_id])
    @band_member.band = @band
    @band_member.user = current_user
    @band_member.approved = false
    if @band_member.save
      flash[:notice] = "Your request is sent to the manager for approval."
      redirect_to user_band_band_member_path(user_id: @band.user_id, id: @band.id)
    else
      flash[:alert] = "You have already submitted your request to join this band."
    end
  end

  def destroy
    @band_member = BandMember.find(params[:id])
    @band = Band.find(params[:band_id])
    @band_member.destroy
    redirect_to user_band_path(@band.user.id, @band), notice: "Request to join band is denied."
  end

  def show
    @band_member = BandMember.find(params[:id])
  end

  private

  def band_member_params
    params.require(:band_member).permit(:user_id, :band_id, :id)
  end
end
