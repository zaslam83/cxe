class StocksController < ApplicationController
layout 'standard'
before_filter :signed_in_user

def new
	@stock = Stock.new
end

def index
  @stocks = Stock.all
end

def show
  @stock = Stock.find(params[:id])
end 

  def create
	@stock = Stock.new(params[:stock])
	@stock.currentbalance = @stock.openingbalance
 
	if @stock.save
		redirect_to @stock
	else
		render 'new'
	end
 end

 def destroy
  @stock = Stock.find(params[:id])
  @stock.destroy
 
  redirect_to stocks_path
end

private 
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end	

 
end
