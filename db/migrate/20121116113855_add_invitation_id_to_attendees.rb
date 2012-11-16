class AddInvitationIdToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :invitation_id, :integer
  end
end
