class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.text :address
      t.string :suburb
      t.string :postcode
      t.string :state
      t.string :country
      t.text :description
      t.integer :capacity
      t.decimal :fee
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
