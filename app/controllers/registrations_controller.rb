class RegistrationsController < Devise::RegistrationsController
  
  protected
  
=begin  
  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      puts "entered if statement"
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
      puts account_update_params.inspect
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      render 'edit'
    else
      render 'additionalForm'
    end
  end
=end
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :address, :phone, :name, :email, :password, :password_confirmation, :current_password)
  end  
  
  def user_edit_params
      params.require[:user].permit(:first_name, :last_name, :nickname, :address, :phone, :current_password)
  end
end
