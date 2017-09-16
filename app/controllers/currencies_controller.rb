class CurrenciesController < ApplicationController
layout 'standard'
before_filter :signed_in_user

def new
	@currency = Currency.new
end

 def create
	@currency = Currency.new(params[:currency])
 
	if @currency.save
		redirect_to @currency
	else
		render 'new'
	end
 end
 
 def update
  @currency = Currency.find(params[:id])
 
  if @currency.update_attributes(params[:currency])
    redirect_to @currency
  else
    render 'edit'
  end
 end
 
 def destroy
  @currency = Currency.find(params[:id])
  @currency.destroy
 
  redirect_to currencies_path
end
  
 def show
  @currency = Currency.find(params[:id])
end 

def index
  @currencies = Currency.all
end
	
def edit
  @currency = Currency.find(params[:id])
end
	
def import
  Currency.import(params[:file])
  redirect_to currencies_path, notice: "Products imported."
end
	
	
private 
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end	
	
end
