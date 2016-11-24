class CreateUserReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reviews do |t|
      t.text :content
      t.integer :score
      t.references :reviewer, references: :users
      t.references :reviewee, references: :users
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
