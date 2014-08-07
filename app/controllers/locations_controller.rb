class LocationsController < ApplicationController

	def home
		@user = User.new
	end  

	def index
    	if !current_user
      		redirect_to home_path
      		return
    	end
#  		@locations = Location.where(user_id: current_user.id)
    	@locations = Location.all
  	end


	def new
		if !current_user
			redirect_to new_session_path
			return
		end
		@location = Location.new
	end


	def create
		if !current_user
			redirect_to new_session_path
			return
		end
		location = Location.new(params.require(:location).permit(:name, :zipcode))

		if location.save
			redirect_to locations_path 
		end
	end
end
