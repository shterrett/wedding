class Admin::InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end
end