class WelcomeController < ApplicationController
  def index
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    # @search2 = client.book("18512") # <--Text example: LOTR by Goodreads ID.
  end

  def results
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])

    @search_raw = client.search_books(params[:search]) # Refactor so user input dictates this.

    # NOTE: the number of parameters per book is 9; therefore view page criterion is 9; CHECK for updates is data structure changes.

    if @search_raw.results.first[1].count == 9
      @unique_result = @search_raw
    else
      @multi_results = @search_raw
    end

    render :_results
  end

end
