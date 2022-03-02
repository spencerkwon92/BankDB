class PreferencesController < ApplicationController
  before_action :authenticate
  before_action :load_task, except: [:index, :new, :create]

  def index
      @preferences = current_user.preferences
  end
  
  def new
    @preference = Preference.new
  end
  
  def create
      @preference = Preference.new preference_params
      @preference.user = current_user
      if @preference.save
        redirect_to preferences_path, notice: "Preference Created."
      else
        render :new
      end
  end
  
  def show
    # @preference = Preference.find params[:id]
    @memo = Memo.new
  end
  
  def edit
    # @preference = Preference.find params[:id]
  end
  
  def update
    # @preference = Preference.find params[:id]
    if @preference.update preference_params
      redirect_to @preference, notice: "Preference Updated."
    else
      render :edit
    end
  end
  
  def destroy
    # load_task
    @preference.destroy
    redirect_to preferences_path, alert: "Preference deleted."
  end
  
  
  private
  
  def load_task
    @preference = current_user.preferences.find params[:id]
  end
  
  def preference_params
    params.require(:preference).permit(:repayment_way, :interest_rate, :amount, :period, :user_id)
  end
  
end
