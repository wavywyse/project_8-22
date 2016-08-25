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
    current_date = Date.today

    @hosting_events = Event.where("user_id = '#{@user.id}'")
    @hosted_events = Event.where("date < '#{current_date}'") if Event.where("user_id = '#{@user.id}'")
    # @attending_events = Event.where("event_id = '#{@event.id}'").select("users.first_name as first_name, users.last_name as last_name, users.city as city, users.state as state")
    # @attended_events = Event.where("date < '#{current_date}'") if Event.where

  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    if user.errors.any?
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/edit'
    else
      redirect_to '/events'
    end
  end


  def join
    join = EventUser.create(user:current_user, event:Event.find(params[:id]))
    redirect_to "/events"
  end
  def unjoin
    e = Event.find(params[:id])
    EventUser.where(user:current_user, event:e).destroy_all
    redirect_to "/events"
  end

   private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  	end

end
