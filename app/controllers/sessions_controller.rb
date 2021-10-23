class SessionsController < ApplicationController
	skip_before_action :require_user_logged_in!, only: [:new, :create]
	def new

	end

	def create
		@user = User.find_by(email: params[:email])
		if @user.present? && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:info] = 'Login Successfully '
			redirect_to root_path
		else
			flash.now[:alert] = 'Invalid email or password'
        	render :new
		end

	end

	def destroy
      session[:user_id] = nil
	  flash[:info] = 'Logged Out'
      redirect_to sign_in_path
    end

end