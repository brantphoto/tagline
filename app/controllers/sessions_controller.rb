class SessionsController < ApplicationController
	def new
		# present an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		#find the user who's trying to login
		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password])
			if u.is_active == false
				redirect_to reactivate_user_path(u.id)
			else
				# store as a cookie in the users' browser the ID of them, indicating they're logged in
				session[:user_id] = u.id.to_s
				redirect_to locations_path
			end
		else
			#go back to the login page
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to users_path
	end
end