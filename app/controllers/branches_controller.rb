class BranchesController < ApplicationController
layout 'standard'
before_filter :signed_in_user
def new
	@branch = Branch.new
end

 def create
	@branch = Branch.new(params[:branch])
 
	if @branch.save
		redirect_to @branch
	else
		render 'new'
	end
 end
 
 def update
  @branch = Branch.find(params[:id])
 
  if @branch.update_attributes(params[:branch])
    redirect_to @branch
  else
    render 'edit'
  end
 end
 
 def destroy
  @branch = Branch.find(params[:id])
  @branch.destroy
 
  redirect_to branches_path
end
  
 def show
  @branch = Branch.find(params[:id])
end 

def index
  @branches = Branch.all
end
	
def edit
  @branch = Branch.find(params[:id])
end

private 
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end	


end
