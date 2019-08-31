class RemoveForeignKeyOfChapters < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :chapters, :histories
  end
end
