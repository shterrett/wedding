class AttendeesController < ApplicationController
  
  def new
    invitation = Invitation.find(params[:invitation_id])
    @attendee = invitation.attendees.create
    new_attendee_form = render_to_string(:layout => false)
    new_attendee_form.gsub!("[#{@attendee.id}]", "[#{Time.now.to_i}]")
    render :text => new_attendee_form
  end
  
  def destroy
    invitation = Invitation.find(params[:invitation_id])
    unless invitation.attendees.exists?(params[:id])
      render :text => { :success => false, :msg => "the child was not found." }.to_json and return
    end
    if invitation.attendees.destroy(params[:id])
      render :text => { :success => true }.to_json
    else
      render :text => { :success => false, :msg => "something unexpected happened." }.to_json
    end
  end
  
  def index
    @attendees = Attendee.where('name IS NOT NULL').order_by(:name)
  end
end
