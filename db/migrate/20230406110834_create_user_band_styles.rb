class CreateUserBandStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_band_styles do |t|
      t.references :user, foreign_key: true
      t.references :style, null: false, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
