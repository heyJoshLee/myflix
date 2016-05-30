class InvitationsController < ApplicationController
  before_filter :require_user

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(invitation_params.merge!(inviter: current_user))
    if @invitation.save
      AppMailer.delay.send_invitation_email(@invitation)
      flash[:success] = "You have successfully sent an invitation email!"
      redirect_to new_invitation_path
    else
      flash[:error] = "There was an error and your invitation was not sent"
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit!
  end

end