class PasswordsController < ApplicationController
	
	def edit
	end
	def update
    if get_current_user.update(password_params)
      redirect_to root_path, notice: 'Password Updated'
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end