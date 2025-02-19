class BooksController < ApplicationController
    allow_unauthenticated_access only: [:index, :show]
  
    before_action :require_authentication, only: [:borrow, :return]
    before_action :set_book, only: [:show, :borrow, :return]
  
    def index
      @books = Book.all
    end
  
    def show
    end
  
    def borrow
      if @book.available?
        Current.session.user.borrowings.create(
          book: @book,
          borrowed_on: Date.today,
          due_on: Date.today + 2.weeks
        )
        redirect_to borrowings_path, notice: "You have borrowed the book successfully!"
      else
        redirect_to book_path(@book), alert: "Book is not available for borrowing."
      end
    end
  
    def return
      borrowing = Current.session.user.borrowings.find_by(book: @book)
      if borrowing
        borrowing.destroy
        redirect_to borrowings_path, notice: "You have successfully returned the book."
      else
        redirect_to book_path(@book), alert: "You cannot return this book."
      end
    end
  
    private
  
    def set_book
      @book = Book.find(params[:id])
    end
  end
  