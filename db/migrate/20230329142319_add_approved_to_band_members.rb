class AddApprovedToBandMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :band_members, :approved, :boolean
  end
end
