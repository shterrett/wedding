class InvitationsController < ApplicationController
  before_filter :authenticate, only: [ :new, :mailing_list ]
  def new
    @invitation = Invitation.create
  end
  
  def show
    @invitation = Invitation.find(params[:id])
    @attendees = @invitation.attendees.order(:name)
  end
  
  def update
    @invitation = Invitation.find(params[:id])
    redirect_path = ( logged_in? ? new_invitation_path : root_path )
    if @invitation.update_attributes(params[:invitation])
      flash[:success] = "Invitation created successfully"
      unless logged_in?
        @invitation.attendees.each do |atnd| 
          RsvpMailer.rsvp_success(atnd).deliver unless atnd.email.blank?
        end
        flash[:success] = "You have successfully RSVPd"
      end
      redirect_to redirect_path
    else
      flash[:error] = "There was an error; please try again."      
      redirect_to redirect_path
    end
  end

  def index
    @invitations = Invitation.search(params[:search])
  end
  
  def mailing_list
    @invitations = Invitation.where("principal_name IS NOT NULL")
    respond_to do |format|
      format.html
      format.csv { render 'app/views/invitations/mailing_list.csv.erb' }
    end
  end
end
