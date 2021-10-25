class CommentFavorite < ApplicationRecord

  belongs_to :user
  belongs_to :book_comment
  belongs_to :comment_favorite

end
