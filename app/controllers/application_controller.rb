class ApplicationController < ActionController::Base
    #It has some problems in here.
    private
    
    def authenticate
        unless current_user
            session[:protected_page] = request.url
            redirect_to login_path, alert: "You need to login to view the page"
        end
    end
    
    def login(user)
        session[:user_id] = user.id
    end
    
    def logout
       session[:user_id] = nil
    end
    
    # def current_user
    #     if @current_user
    #         @current_user
    #     else
    #         @current_user = User.find session[:user_id] if session[:user_id]
    #     end
    # end
    
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    
    def admin_authorize
        unless current_user && current_user.is_admin?
            redirect_to root_path, alert: "You are not athorized to access the page."
        end
    end
    
    helper_method :current_user
end