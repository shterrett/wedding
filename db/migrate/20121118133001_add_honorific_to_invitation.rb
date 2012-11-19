class AddHonorificToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :honorific, :string
  end
end
