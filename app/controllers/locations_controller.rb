class LocationsController < ApplicationController

	def home
		@user = User.new
	end  

	def index
#  		@locations = Location.where(user_id: current_user.id)
		if params[:search]
			@locations = Location.search(params[:search])
		else
    		@locations = Location.all
    	end
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
