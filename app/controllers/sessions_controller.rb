class SessionsController < ApplicationController
	skip_before_action :require_user_logged_in!, only: [:new, :create, :omniauth]
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

	def omniauth
		@user = User.from_omniauth(auth)
		@user.save
		session[:user_id] = @user.id
		redirect_to root_path
	end
	  private
	  def auth
		request.env['omniauth.auth']
	  end

end