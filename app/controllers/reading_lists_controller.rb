class ReadingListsController < ApplicationController

  def index
    @reading_list = ReadingList.all
  end

  def new

    @book = Book.new(goodreads_ID: params[:book_id])
    @reading_list = ReadingList.new
    if Book.exists?(goodreads_ID: params[:book_id])
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
      redirect_to('/', alert: "Sorry, something went wrong.")
    end
  end

  def show
    @current_club = Club.find(params[:id])
    @current_list = ReadingLists.where(club_id:params[:id])
  end

  def edit

  end

  def destroy

  end

private
  def reading_list_params
    params.permit(:book_id, :club_id)
  end
end
