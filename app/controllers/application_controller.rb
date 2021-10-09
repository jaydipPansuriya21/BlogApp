class ApplicationController < ActionController::Base
	before_action :set_current_user
	helper_method :get_current_user
	def set_current_user
     	@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def require_user_logged_in!
      	redirect_to sign_in_path, alert: 'You must be signed in' if @current_user.nil?
    end

    def get_current_user
    	@current_user
    end
end
