class ReadingListsController < ApplicationController

  def index

  end

  def create

  end

  def show
    @current_club = Club.find(params[:id])
    @current_list = ReadingLists.where(club_id:params[:id])
  end

  def edit

  end

  def destroy

  end
end
