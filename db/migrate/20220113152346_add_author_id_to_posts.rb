class AddAuthorIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :author_id, :integer
    add_index :posts, :author_id
  end
end
