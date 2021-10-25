class CommentFavoritesController < ApplicationController

     def create
        comment = Comment.find(params[:book_id, :book_comment_id])
        favorite = CommentFavorite.new(user_id: current_user.id, book_comment_id: comment.id)
        #favorite = current_user.favorites.new(book_id: book.id)
        favorite.save
        #redirect_back(fallback_location: root_path)
        redirect_to request.referer
     end


end
