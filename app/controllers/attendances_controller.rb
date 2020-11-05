class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show

  end

  def new
      @new_attendance = Attendance.new
      @event = Event.find(params[:event_id])
      @amount = @event.price * 100
  end

  def create
      @event = Event.find(params[:event_id])
      @amount = @event.price * 100

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })
      
      @new_attendance = Attendance.create(participant: current_user, event: @event, stripe_customer_id: params[:stripeToken])

      rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to new_event_attendance_path
      
          
  end

end
