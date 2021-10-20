class RegistrationsController < ApplicationController
	skip_before_action :require_user_logged_in!, only: [:new, :create] 
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_param)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "User created successfully, Logged in successfully !"
		else
			render :new
		end
	end

	private

	def user_param
		params.require(:user).permit(:email, :password, :password_confirmation)
	end


end
