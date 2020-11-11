class Admin::EventsController < ApplicationController
  before_action :is_admin?
  def index
    @not_validate = Event.where(validated: nil)
  end

  def show
    @not_validate = Event.find(params[:id])
  end

  def edit
    @not_validate = Event.find(params[:id])
    @not_validate.update(validated: params[:validated])
    redirect_to(admin_events_path)
  end

  def update
    redirect_to(admin_events_path)
  end

  private

  def is_admin?
    unless authenticate_user! && current_user.is_admin === true
      redirect_to "/"
    end
  end


end
