class MembershipsController < ApplicationController

  def new
    render 'form'
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id

    if @membership.save
      @success_text = "Success!"
    else
      @success_text = "Failure!"
    end

    # Check: show the same page or take to a lists page?
    redirect_to(club_reading_lists_path, alert: "Hurrah, you've succesfully joined!")
  end

  def edit
  end

  def destroy
  end

  def membership_params
    params.permit(:club_id, :user_id)
  end

end
