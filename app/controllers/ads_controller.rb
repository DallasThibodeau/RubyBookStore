class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ad.build(ad_params)
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to 'static_pages/home'
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @ad.destroy
    flash[:success] = "Ad deleted"
    redirect_to request.referrer || 'static_pages/home'
  end
  
  def get 
    ad = current_user.ads.find_by_id(params[:id]) 
    if ad
      
    end
  end

  private

    def ad_params
      params.require(:ad).permit(:title, :price, :description, :picture)
    end

    def correct_user
      @ad = current_user.ads.find_by(id: params[:id])
      redirect_to root_url if @ad.nil?
    end
end