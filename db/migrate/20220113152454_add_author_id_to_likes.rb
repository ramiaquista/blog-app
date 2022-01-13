class AddAuthorIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :author_id, :integer
    add_index :likes, :author_id
  end
end
