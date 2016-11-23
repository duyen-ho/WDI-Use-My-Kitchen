class CreateKitchenReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_reviews do |t|
      t.text :content
      t.integer :score
      t.references :user, foreign_key: true
      t.references :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
