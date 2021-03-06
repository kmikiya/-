class BooksController < ApplicationController

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user

    end

    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
          flash[:notice] = "successfully"
         redirect_to user_path(@book.user_id)
      else
          @books = Book.all
          @user = current_user
          render :index
      end
    end

    def show
        @comment = BookComment.find(params[:id])
        @book = Book.find(params[:id])
        @user = @book.user
        @book_show = Book.new
        @book_comment = BookComment.new
    end

    def edit
        @book = Book.find(params[:id])
        redirect_to books_path unless current_user == @book.user_id
    end

    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        if @book.update(book_params)
           flash[:notice] = "successfully"
           redirect_to book_path(@book.id)
        else
           render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
