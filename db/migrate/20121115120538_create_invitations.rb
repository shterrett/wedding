class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :principal_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
