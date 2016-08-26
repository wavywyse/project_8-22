class EventsController < ApplicationController
  def index
    @state_events = Event.where("state = '#{current_user.state}'")
    @out_state_events = Event.where.not("state = '#{current_user.state}'")
  end

  def show
    @event = Event.find(params[:id])
    @host = User.find(@event.user_id)
    @joins = EventUser.joins(:user).where("event_id = #{@event.id}").select("users.first_name as first_name, users.last_name as last_name, users.city as city, users.state as state")
    @comments = Comment.joins(:user).where("event_id = #{@event.id}").select("users.first_name as name, comments.content as content")
  end

  def create
    event = Event.new(event_params)
    event.user = current_user 
    event.valid?
    if event.errors.any?
      flash[:errors] = event.errors.full_messages
    else
      event.save
    end
    redirect_to "/events"
  end

  def edit
    @event = Event.find(params[:id])
  end
  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.errors.any?
      flash[:errors] = event.errors.full_messages
      redirect_to "/events/edit/#{params[:id]}"
    else
      redirect_to "/events/show/#{params[:id]}"
    end
  end
  def destroy
    Event.find(params[:id]).destroy
    redirect_to "/events"
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
  def event_params
    params.require(:event).permit(:name, :date, :time, :city, :state)
  end

end
