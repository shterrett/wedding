class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.create
  end
  
  def show
    @invitation = Invitation.find(params[:id])
  end
  
  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      flash[:success] = "Invitation created successfully"
      redirect_to invitation_path(@invitation)
    else
      flash[:error] = params
      redirect_to "/"
    end
  end

  def index
  end
  
end
