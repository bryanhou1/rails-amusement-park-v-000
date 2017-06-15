class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.create(user_params(:name, :password, :happiness, :nausea, :tickets, :height, :admin))
		session[:user_id] = user.id
		redirect_to user_path(user)
	end

	def show
		@user = User.find(params[:id])
		authorize @user
	end

	private

	def user_params(*args)
		params.require(:user).permit(*args)
	end
end
