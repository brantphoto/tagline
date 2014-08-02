class QuotesController < ApplicationController
def index
  	@quotes = Quote.all
  end

  def show
  	@quote = Quote.find(params[:id])
  end

  def new
  	@quote = Quote.new
  end

  def create
  	@quote = Quote.new(params.require(:bean).permit(:name, :roast, :origin, :quantity))
  	if @quote.save
  		redirect_to quotes_path
  	else
  		render 'new'
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
    redirect_to quotes_path
  end
end
