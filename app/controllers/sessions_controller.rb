class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.find_by(name: params[:user][:name])
			if User.validate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to user_path(user)
			else
				redirect_to new_session_path, notice: 'incorrect password'
			end
		else
			redirect_to new_session_path, notice: 'user not found'
		end
	end

	def destroy
		session.delete :user_id
		redirect_to :root
	end
end