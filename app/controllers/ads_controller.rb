class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ad.build(ad_params)
    @ad.book.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
    if @ad.save!
      flash[:success] = "Ad created!"
      redirect_to home_path
    else
      @feed_items = []
      redirect_to home_path
    end
  end

  def destroy
    @ad.destroy
    flash[:success] = "Ad deleted"
    redirect_to request.referrer || 'static_pages/home'
  end

  private

    def ad_params
      params.require(:ad).permit(:title, :price, :description, :picture)
    end

    def correct_user
      @ad = current_user.ad.find_by(id: params[:id])
      redirect_to root_url if @ad.nil?
    end
end