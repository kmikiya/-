class FavoritesController < ApplicationController
    
    def create
        book = Book.find(params[:book_id])
        favorite = Favorite.new(user_id: current_user.id, book_id: book.id)
        #favorite = current_user.favorites.new(book_id: book.id)
        favorite.save
        #redirect_back(fallback_location: root_path)
        redirect_to request.referer

    end
    
    def destroy
        book = Book.find(params[:book_id])
        favorite = Favorite.find_by(user_id: current_user.id, book_id: book.id)
        #favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
       # redirect_back(fallback_location: root_path)
        redirect_to request.referer

    end
end
