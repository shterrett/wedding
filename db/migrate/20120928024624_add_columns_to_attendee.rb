class AddColumnsToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :name, :string
    add_column :attendees, :email, :string
    add_column :attendees, :vegetarian, :boolean
  end
end
