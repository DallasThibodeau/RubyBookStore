class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @ad  = current_user.ad.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about    
  end
end
