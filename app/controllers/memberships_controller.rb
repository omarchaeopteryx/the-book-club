class MembershipsController < ApplicationController

  def new
    render 'form'
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id

    p @membership

    if @membership.save
      redirect_to '/'
    else
      render 'show'
    end
  end

  def edit
  end

  def destroy
  end

  def membership_params
    params.permit(:club_id, :user_id)
  end

end
