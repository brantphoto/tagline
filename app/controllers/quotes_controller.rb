class QuotesController < ApplicationController
  before_action :get_location
  before_action :check_security, only:[:new, :create, :edit, :update, :destroy]

  def index
  	@quotes = @location.quotes
    @locations = Location.all
  end

  def new
  	@quote = Quote.new
  end

  def create
  	@quote = Quote.new(params.require(:quote).permit(:quote))
  	# Attach this criterion to a decision
    @quote.location = @location
    @quote.user = current_user
    if @quote.save
      redirect_to location_quotes_path(@location.id)
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @quote = Quote.find(params[:id]) 
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(params.require(:bean).permit(:name, :roast, :origin, :quantity))
      redirect_to quotes_path 
    else
      render 'edit'
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to location_quotes_path(@location.id) 
  end

private 
  def get_location
    @location = Location.find(params[:location_id])
  end

  # def get_user 
  #   @user = User.find(params[:_id])
  #   quote

  def check_security
    if !current_user
      redirect_to new_session_path
    end
  end




end
