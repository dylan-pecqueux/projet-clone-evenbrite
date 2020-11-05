class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    @event.admin = current_user
    if @event.save
      redirect_to @event
      flash[:notice] = 'Ton événement a bien était enregistré'
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location, :picture)
  end
end
