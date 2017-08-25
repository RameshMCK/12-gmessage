class AddIsFavoriteToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :is_favorite, :boolean, default: true 
  end
end
