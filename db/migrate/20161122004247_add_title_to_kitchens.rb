class AddTitleToKitchens < ActiveRecord::Migration[5.0]
  def change
    add_column :kitchens, :title, :string
  end
end
