class BookComment < ApplicationRecord

    belongs_to :user
    belongs_to :book
    has_many :comment_favorite, dependent: :destroy

     def bfavorite_by?(user)
        comment_favorites.where(user_id: book_comment.id).exists?
     end
end
