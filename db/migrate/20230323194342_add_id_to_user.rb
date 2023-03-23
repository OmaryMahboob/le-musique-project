class AddIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :band, null: false, foreign_key: true
  end
end
