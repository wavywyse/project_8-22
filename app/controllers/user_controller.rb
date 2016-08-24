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

    @user = User.find(params[:id])

    @hosting_events = Event.where("user_id = '#{@user.user_id}'")
    @attending_events = Event.where("")
    @hosted_events = Event.where("")
    @attended_events = Event.where("")

  end

  def edit
    @user = current_user
  end

   private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  	end

end
