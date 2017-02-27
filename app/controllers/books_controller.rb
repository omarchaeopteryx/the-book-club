class BooksController < ApplicationController

  def show
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    @book_search_result = client.book(params[:id])

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
