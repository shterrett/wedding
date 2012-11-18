class AddMessageToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :message, :string
  end
end
