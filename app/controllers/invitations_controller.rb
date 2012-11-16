class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.create
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      flash[:success] = "Invitation created successfully"
      redirect_to new_invitation_path
    else
      render 'new'
    end
  end

  def index
  end
  
end
