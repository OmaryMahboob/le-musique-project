class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.references :user, null: false, foreign_key: true
      t.string :band_name
      t.string :band_style
      t.boolean :looking_for_member
      t.text :multimedia
      t.string :style
      t.text :experience
      t.text :content
      t.string :city

      t.timestamps
    end
  end
end
