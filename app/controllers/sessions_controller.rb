class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      # session[:user_id] = @user.id
      login(@user)
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to login_path, alert: "Invalid email/password"
    end
    rescue BCrypt::Errors::InvalidHash
      redirect_to login_path, alert: "Invalid Password. Did you sign up with Github?"
    #   redirect_url = session[:protected_page] ? session[:protected_page] : root_path
    #   session[:protected_page] = nil
    #   redirect_to redirect_url, notice: "Logged In"
    # else
    #   redirect_to login_path, alert: "Invalid email/password"
    # end
  end
  
  def destory
    # session[:user_id] = nil
    logout
    redirect_to root_path, notice: "Logged Out"
  end
  
end
 