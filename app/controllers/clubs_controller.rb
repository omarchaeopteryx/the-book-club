class ClubsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def edit
    # Add membership validation here before letting users edit.
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club
    else
      render 'new'
    end
  end

  def show
    @club = Club.find(params[:id])
    @membership = Membership.new(club_id: params[:id])
    @members = @club.members
    @reading_lists = @club.reading_lists
    render 'show'
  end

  def update
    # Add membership validation here before letting users edit.
    @club = Club.find(params[:id])

    if @club.update(club_params)
      redirect_to @club
    else
      render 'edit'
    end
  end

  def destroy
    # Add membership validation here before letting users edit.
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to clubs_path
  end

private
  def club_params
    params.require(:club).permit(:name, :description)
  end
end
