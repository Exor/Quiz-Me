class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(name: params[:session][:username].downcase)
	if user && user.authenticate(params[:session][:password])
		sign_in user
		redirect_to browse_path
	else
		flash.now[:error] = 'Invalid username/password combination'
		render 'new'
	end
end

def destroy
	sign_out
	redirect_to root_path
end

end
