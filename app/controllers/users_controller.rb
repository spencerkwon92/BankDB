class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  
  def index
  end
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    
    if @user.save
      session[:user_hash] = nil
      login(@user)
      # session[user_id]
      redirect_to root_path, notice: "Account Created"
    else
      render :new
    end
  end
  
  def show
    @user = current_user
  end

  def update
    if current_user.update user_params
      redirect_to current_user, notice:"User information updated"
    else
      render :edit
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def destroy
    # @session = User.find session[:user_id]
    # @session.destroy

    current_user.destroy
    redirect_to logout_path, alert: "User deleted"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birth_day, :phone)
  end
  
end
