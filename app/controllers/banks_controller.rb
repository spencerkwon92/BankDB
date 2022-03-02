class BanksController < ApplicationController
  before_action :authenticate
  before_action :admin_authorize, except: [:show]
  def index
    @banks = Bank.all
  end
  
  def new   
    @bank = Bank.new
  end
  
  def create
    @bank = Bank.new bank_params
    
    if @bank.save
      redirect_to banks_path, notice:"Your bank is registered."
    else
      render :new
    end
    
  end
  
  def show
    @bank = Bank.find params[:id]
  end
  
  def destroy
    @bank = Bank.find params[:id]
    @bank.destroy
    redirect_to banks_path, alert: "Bank Deleted."
  end
  
  def edit
    @bank = Bank.find params[:id]
    
  end
  
  def update
    @bank = Bank.find params[:id]
    
    if @bank.update bank_params
      redirect_to @bank, notice: "Your Bank information is updated"
    else
      render :edit
    end
  end

  
  private
  
  def bank_params
    params.require(:bank).permit(:name, :assets, :employees, :location)
  end
  
end