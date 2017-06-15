class RidesController < ApplicationController
	def create
		ride = Ride.create(user_id: params[:user_id],attraction_id: params[:attraction_id])
		flash[:alert] = ride.take_ride
		redirect_to user_path(current_user)
	end

end