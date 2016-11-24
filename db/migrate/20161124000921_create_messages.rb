class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender, references: :users
      t.references :recipient, references: :users

      t.timestamps
    end
  end
end
