class UsersController < ApplicationController
  #Uncomment once user levels have been added
  #before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  #before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy
  
  def show
    @user = User.find(params[:id])
    debugger
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #Uncomment when mailer is working
      #@user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private 
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
