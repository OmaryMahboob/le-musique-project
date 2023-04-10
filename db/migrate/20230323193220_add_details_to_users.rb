class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :nickname, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :profile_picture, :string
    add_column :users, :multimedia, :string
    add_column :users, :description, :string
    add_column :users, :looking_for_band, :boolean
    add_column :users, :experience, :string
  end
end
