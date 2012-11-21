class InvitationsController < ApplicationController
  before_filter :authenticate, only: :new
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
      redirect_to redirect_path
    else
      flash[:error] = params      
      redirect_to redirect_path
    end
  end

  def index
    @invitations = Invitation.search(params[:search])
  end
  
  def mailing_list
    @invitations = Invitation.where("principal_name IS NOT NULL")
  end
end
