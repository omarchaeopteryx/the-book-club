class WelcomeController < ApplicationController
  def index
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    @search2 = client.book("18512") # Example book: LOTR by Goodreads ID.
  end

  def results
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    @search1 = client.search_books(params[:search]) # Refactor so user input dictates this.
    render :_results
  end

end
