class SessionsController < ApplicationController
  def index
  	if !flash[:errors]
  		flash[:errors] = []
  	end
  end

  def login
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = ["Invalid Combination"]
  		redirect_to :root
	end
  end

  def logout
  	reset_session
  	redirect_to :root
  end
end
