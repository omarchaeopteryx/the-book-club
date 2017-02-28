class ReadingListsController < ApplicationController

  def index

  end

  def new
    @reading_list = ReadingList.new(book_id: params[:book_id])

    @my_memberships = current_user.clubs

    @my_clubs = @my_memberships.map { |i| [i.name, i.id] }

  end

  def create
    @reading_list = ReadingList.new(reading_list_params)
    if @reading_list.save
      p "Saved!"
      p @reading_list
    else
      p "Oops."
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
