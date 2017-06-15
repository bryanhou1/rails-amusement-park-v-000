class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user

  def take_ride
  	if enough_ticket? && tall_enough?
  		#take ride
  		user.tickets = user.tickets - attraction.tickets
  		user.nausea = user.nausea + attraction.nausea_rating
  		user.happiness = user.happiness + attraction.happiness_rating
  		user.save
      notice = "Thanks for riding the #{attraction.name}!"
  	else
  		notice = "Sorry."

  		if !enough_ticket?
  			notice <<  " You do not have enough tickets to ride the #{attraction.name}."
  		end

  		if !tall_enough?
  			notice <<  " You are not tall enough to ride the #{attraction.name}."
  		end

  		return notice
  	end
  end

  private

  def enough_ticket?
  	user.tickets > attraction.tickets
  end

  def tall_enough?
  	user.height >= attraction.min_height
  end

end

