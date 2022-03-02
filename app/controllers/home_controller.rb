class HomeController < ApplicationController
  
  
  def index
    @banks = Bank.all
  end
  
  def about
  end
end
