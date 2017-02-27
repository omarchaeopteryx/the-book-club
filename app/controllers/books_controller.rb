class BooksController < ApplicationController

  def show
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    @book_search_result = client.book(params[:id]) # <--Text example: LOTR by Goodreads ID.
  end

end