class VotesController < ApplicationController
	 # before_action, :new_vote , except: [:create] 
	 before_action :get_quote
	 before_action :check_security

  def create
  	vote = Vote.new
  	vote.user = current_user
  	vote.quote = @quote
  	if vote.save 
  		redirect_to location_quotes_path(@quote.location.id)
  	end

  end

  def update
  end

  def destroy
  end

 private
 	def get_quote
 		@quote = Quote.find(params[:quote_id])
 	end

 	# def new_vote


  def check_security
    if !current_user
      redirect_to home_path
    end
  end
end


