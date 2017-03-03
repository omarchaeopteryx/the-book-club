class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def new
    render 'form'
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id
    @club = Club.find(params[:club_id])

    if @membership.save
      @success_text = "Hurrah! Success!"
      redirect_to(club_path(@club), alert: @success_text)
    else
      @success_text = "Alas. Failure!"
      redirect_to(clubs_path, alert: @success_text) # They should not see this if things are working correctly; logic is hidding membership button.
    end
  end

  def edit
  end

  def show
    @my_clubs = Membership.where(user_id: current_user.id)
    render 'show'
  end

  def destroy
    current_user
      .memberships
      .find_by(club_id: params[:id])
      .destroy
    redirect_to club_path
  end

  private

  def membership_params
    params.permit(:club_id, :user_id)
  end

end
