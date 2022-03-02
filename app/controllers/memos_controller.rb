class MemosController < ApplicationController
  before_action :authenticate
  before_action :load_preference
  before_action :load_memo, except: [:index, :new, :create]
  
  def index
    # @preference = Preference.find params[:preference_id]
    # @memos = Memo.all
    
    @memos = @preference.memos

  end
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new memo_params
    @memo.preference = @preference
    if @preference.memos << @memo
      redirect_to preference_memos_path(@preference), notice: "Memo created."
    else
      render :new
    end
  end
  
  def show
    # @memo = @preference.memos.find params[:id]
  end
  
  def edit
    
  end
  
  def update
    
    if @memo.update memo_params
      redirect_to [@preference, @memo], notice: "Memo Updated."
    else
      render :edit
    end
    
  end
  
  def destroy
    @memo.destroy
    redirect_to preference_memos_path(@preference)
  end
  
  private
  def load_preference
    @preference = current_user.preferences.find params[:preference_id]
  end
  

  def load_memo
    @memo = @preference.memos.find params[:id]
  end
  
  def memo_params
    params.require(:memo).permit(:body)
  end
end
