class UsersController < ApplicationController
  #Uncomment once user levels have been added
  #before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  #before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy
  
  def show
    @user = User.find(params[:id])
    @ad = @user.ads.paginate(page: params[:page])
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:success] = "Profile updated"
      redirect_to edit_profile_path
    else
      render edit_profile_path
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def show
    @user = user.find(params[:user])
  end
  
  private 
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  def user_edit_params
      params[:user].permit(:first_name, :last_name, :nickname,
                                   :address, :phone)
  end
end
