class EventsController < ApplicationController
  before_action :require_login
  before_action :require_user, only: [:update, :edit, :delete]
  def index
    @user = User.find(session[:user])
    @events_in_state = Event.where(state:@user.state)
    @events_out_state = Event.where.not(state:@user.state)
  end

  def create
    event = User.find(session[:user]).events.new(event_params)
    if event.valid?
      event.save
    else
      flash[:alert]=event.errors.full_messages
    end
    redirect_to '/events/index'
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.valid?
      event.save
      redirect_to '/events/index'
    else
      flash[:alert]=event.errors.full_messages
      redirect_to '/events/edit/'+params[:id]
    end
  end

  def delete
    Event.find(params[:id]).delete
    redirect_to '/events/index'
  end

  def join
    event = Event.find(params[:id])
    event.attendings.create(user_id:session[:user])
    redirect_to '/events/index'
  end

  def leave
    Event.find(params[:id]).attendings.find_by_user_id(session[:user]).delete
    redirect_to '/events/index'
  end

  def require_login
    redirect_to '/' unless session[:user]
  end
  def require_user
    redirect_to '/events/index' unless session[:user] == Event.find(params[:id]).user.id
  end
  def event_params
    params.require(:event).permit(:name, :date, :location, :state)
  end
end
