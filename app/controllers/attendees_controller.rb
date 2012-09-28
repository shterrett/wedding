class AttendeesController < ApplicationController
  
  def new
    @attendee = Attendee.new
  end
  
  def create
    @attendee = Attendee.new(params[:attendee])
    if @attendee.save
      flash[:success] = "Your RSVP has been logged successfully"
      redirect_to new_attendee_path
    else
      render 'new'
    end
  end

  def index
  end
end
