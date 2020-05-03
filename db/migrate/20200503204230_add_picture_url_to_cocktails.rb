class AddPictureUrlToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :picture_URL, :string
  end
end
