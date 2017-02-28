class BooksController < ApplicationController

  def index

  end
  def show
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    @book_search_result = client.book(params[:id])

    # Preparing data for making a new book-club join via reading-list - FIX:
    @book = Book.new(goodreads_ID: params[:id])
    @reading_list = ReadingList.new(book_id: @book.goodreads_ID)

    # Extracting options for drop-down menu through logic:
    # @my_memberships = Membership.where(user_id: current_user.id)
    @my_memberships = current_user.clubs

    @my_clubs = @my_memberships.map { |i| [i.name, i.id] }

    # Setting up default author incase N/A:
    @book_search_result_author = ""

    if @book_search_result.authors.first[1][0] != nil
      @book_search_result_author = @book_search_result.authors.first[1][0].name
    elsif @book_search_result.authors.first[1][0] == nil
      @book_search_result_author = @book_search_result.authors.first[1].name
    end
    # FIX: What if there are mulitple authors of books?
    # p @book_search_result <--Debugger
  end

end
