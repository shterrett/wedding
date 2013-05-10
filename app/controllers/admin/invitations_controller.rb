class Admin::InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      flash[:success] = "Invitation Successfully Created"
      redirect_to new_admin_invitation_path
    else
      flash[:error] = "Error in Invitation; please review"
      render 'new'
    end
  end
  
  def edit
    @invitation = Invitation.find(params[:id])
  end
  
  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(params[:invitation])
      flash[:success] = "Invitation Successfully Updated"
      redirect_to admin_invitation_path(@invitation)
    else
      flash[:error] = "Error in Invitation; please review"
      render 'edit'
    end
  end
  
  def index
    @invitations = Invitation.all
  end
  
  def show
    @invitation = Invitation.find(params[:id])
  end
  
end