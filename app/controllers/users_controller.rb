class UsersController < ApplicationController
layout 'standard'
#before_filter :signed_in_user

  def new
	@user = User.new
  end
  
  def create
	@user = User.new(params[:user])
 
	if @user.save
		redirect_to @user
	else
		render 'new'
	end
  end
  
  def destroy
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
end
  
  
  def index
  @users = User.all
end
  
 def show
  @user = User.find(params[:id])
end 

private 
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end	


end
