class ProductsController < ApplicationController
  before_action :load_bank
  before_action :admin_authorize
  
  before_action :load_product,except: [:index, :new, :create]
  
  def index
    @products = @bank.products
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new product_params
    @product.bank = @bank
    
    if @bank.products << @product
      redirect_to bank_products_path(@bank), notice: "Product registered"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
    
  end
  
  def update
    if @product.update product_params
      redirect_to [@bank, @product], notice: "Product info updated"
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    redirect_to bank_products_path(@bank)
  end
  
  private
  
  def load_bank
    @bank = Bank.find params[:bank_id]
  end
  
  def load_product
      @product = @bank.products.find params[:id]
  end
  
  def product_params
    params.require(:product).permit(:name, :interest, :repayment_way, :period)
  end
  
end
