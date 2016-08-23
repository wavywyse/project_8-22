class UserController < ApplicationController

  def create
  	user = User.new(user_params)
		if user.save
  			session[:user_id] = user.id
  			redirect_to "/events"
  		else
  			flash[:errors] = user.errors.full_messages
  			redirect_to :root 
  		end
   end

   def display
  end

  def edit
  end

   private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  	end

end
