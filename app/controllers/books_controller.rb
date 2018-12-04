class BooksController < ApplicationController

  def index

    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    if params['/books/new'] != nil
      @raw_books = GoogleBooks::API.search("#{search_by}:#{params['/books/new']['q']}")
    end

    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if Book.find_by(title: "#{@book.title}") == nil
      @book.save
    else
      @book = Book.find_by(title: "#{@book.title}")
    end
    redirect_to @book
  end

  private

  def book_params
    # params.require(:book).permit(:title, :authors, :page_count, :description, :categories, :average_rating, :thumbnail)
    title = params['rawbook']
    raw_book = GoogleBooks::API.search(title).first
    {
      title: raw_book.title,
      authors: raw_book.authors.join(', '),
      page_count: raw_book.page_count,
      description: raw_book.description,
      categories: raw_book.categories.join(', '),
      average_rating: raw_book.average_rating,
      thumbnail: raw_book.covers[:thumbnail]
    }
  end

  def search_by
    num = params[:search_by]
    if num == 1
      return 'intitle'
    elsif num == 2
      return 'inauthor'
    elsif num == 3
      return 'subject'
    end
  end

end
