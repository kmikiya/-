class AddBookCommentIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :book_comment_id, :integer
  end
end
