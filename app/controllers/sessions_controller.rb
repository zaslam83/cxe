class SessionsController < ApplicationController
layout 'standard'
def create
  user = User.find_by_username(params[:session][:username])
  if user && user.authenticate(params[:session][:password])
    sign_in user
	redirect_to currencies_path
  else
    render 'new'
  end
end

def destroy
	sign_out
	redirect_to signin_path
end

end
