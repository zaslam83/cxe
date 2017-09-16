class TransactionsController < ApplicationController
layout 'standard'
before_filter :signed_in_user


def newstockin
	@transaction = Transaction.new
end

def newbuy
	@transaction = Transaction.new
end

def newsell
	@transaction = Transaction.new
end

def show
  @transaction = Transaction.find(params[:id])
end 

 def index
  @transactions = Transaction.all
end

def destroy
  @transaction = Transaction.find(params[:id])
  @transaction.destroy
 
  redirect_to transactions_path
end

def createstockin
	@transaction = Transaction.new(params[:transaction])
	@transaction.totalamt = @transaction.amount
	@transaction.trantype = 'Stock In'
	savetransaction @transaction
end

def createbuy
	#render text: params[:transaction].inspect
	@transaction = Transaction.new(params[:transaction])
	@transaction.trantype = 'Buy'
	savetransaction @transaction
end

def createsell
	@transaction = Transaction.new(params[:transaction])
	@transaction.trantype = 'Sell'
	savetransaction @transaction
end

def getrate
	@currency = Currency.where(:id => params[:currid]).first
	render text: @currency.buyrate
end

private 
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end	

	def savetransaction(transaction)
		@transaction.branch_id = @current_user.branch_id
		@transaction.user_id = @current_user.id
 
		if @transaction.save
			stock = Stock.find_or_initialize_by_currency_id_and_branch_id(@transaction.currency_id, @transaction.branch_id)
			#stock = Stock.where(:currency_id => @transaction.currency_id).where(:branch_id => @transaction.branch_id).first
			if @transaction.trantype == 'Stock In' || @transaction.trantype == 'Buy'  	
				stock.currentbalance =  @transaction.amount + (stock.currentbalance == nil ? 0 : stock.currentbalance)
				stock.openingbalance =   (stock.openingbalance == nil ? 0 :stock.openingbalance)
			else
				stock.currentbalance = (stock.currentbalance == nil ? 0 : stock.currentbalance) - @transaction.amount
				stock.openingbalance =   (stock.openingbalance == nil ? 0 :stock.openingbalance)
			end
			stock.save
			redirect_to @transaction
		else
			render 'new'
		end
	end
	
end
