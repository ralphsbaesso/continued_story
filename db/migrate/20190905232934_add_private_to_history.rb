class AddPrivateToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :private, :boolean, default: false
  end
end
