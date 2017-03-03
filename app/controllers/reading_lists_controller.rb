class ReadingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reading_list = ReadingList.all
  end

  def new

    @book = Book.new(goodreads_id: params[:book_id])

    @book.name = get_goodreads_title(params[:book_id])

    p @book

    @reading_list = ReadingList.new
    if Book.exists?(goodreads_id: params[:book_id])
      p "OK - already in database"
    else
      @book.save
    end

    @my_memberships = current_user.clubs

    @my_clubs = @my_memberships.map { |i| [i.name, i.id] }

  end

  def create
    @reading_list = ReadingList.new(reading_list_params)

    p @reading_list

    if @reading_list.save
      p "Saved!"
      redirect_to(clubs_path)
      p @reading_list
    else
      p "Oops."
      redirect_to('/', alert: "That book has already been saved! Ready for another one?")
    end
  end

  def show
    # Something to think about: which/whose notes do we allow to be shown?
    # This will be the main hub of book-note-user-saving activity.
    @current_list = ReadingList.find_by_id(params[:id])
    @current_club = @current_list.club
    @current_book_notes = @current_list.book.notes

  end

  def edit

  end

  def destroy

  end

private
  def reading_list_params
    params.permit(:book_id, :club_id)
  end

  def get_goodreads_title(id)
    client = Goodreads::Client.new(api_key: ENV['GR_KEY'], api_secret: ENV['GR_SECRET'])
    # @search2 = client.book("18512") # <--Text example: LOTR by Goodreads ID.
    title = client.book(id.to_s).title
    return title
  end
end
