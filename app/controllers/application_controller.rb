class ApplicationController < ActionController::Base
  
  #Authenricate user before any action is taken.
  before_action :authenticate_user!
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def hello
    render text: "hello, world!"
  end
  
end
