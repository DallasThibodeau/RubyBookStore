class AdsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ad.new(ad_params)
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to home_path
    else
      @feed_items = []
      render 'new'
    end    
  end
  
   def show
    #If statement becuase Dallas messed up on passing params... Jeez thx Dallas :X 
    if params[:book] == nil && params[:ad] == nil && params[:user] == nil 
      @ad = Ad.find(params[:id])
      @book = Book.find(params[:id])
      @user = User.find(params[:id])
    else
      @ad = Ad.find(params[:ad])
      @book = Book.find(params[:book])
      @user = User.find(params[:user])
    end
    @comments = Comment.where("ad_id = ?", @ad.id)
    @starrating = Starrating.where(:ownerID=>@user.id)
    
    respond_to do |format|
      format.html
      format.json{render json: @ad}
    end
   end
  
  def destroy
    @ad.destroy
    flash[:success] = "Ad deleted"
    redirect_to request.referrer || 'static_pages/home'
  end
  
  def index
    if params[:search]
      @ads = Ad.search(params[:search]).order("created_at DESC")
    else
      @ads = Ad.order("created_at DESC")
    end
  end
  
  
  private
    def ad_params
      params.require(:ad).permit(:title, :price, :description, :picture, :books_id)
    end

    def correct_user
      @ad = current_user.ad.find_by(id: params[:id])
      redirect_to root_url if @ad.nil?
    end
end