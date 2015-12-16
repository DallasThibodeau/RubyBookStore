class StarratingsController < ApplicationController
  
  def new
    @starrating = Starrating.new
  end
  
  def create
    @starrating = Starrating.new(star_params)
    if @starrating.save
      flash[:success] = "Rating created!"
      redirect_to request.referrer || 'static_pages/home'
    end
  end
  
  def show
    @starrating = Starrating.find(params[:Owner_id])
  end
  
  private

    def star_params
      params.require(:starrating).permit(:ownerID, :raterID, :ad_id, :rating)
    end
  
end