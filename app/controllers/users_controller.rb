class UsersController < ApplicationController

  before_filter :require_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

def new_with_invitation
    invitation = Invitation.find_by(token: params[:token])
    if invitation
      @user = User.new(email: invitation.recipient_email)
      @invitation_token = invitation.token
      render :new
    else
      redirect_to expired_token_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      handle_invitaiton
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      
      StripeWrapper::Charge.create(
        amount: 999,
        card: params[:stripeToken],
        description: "Sign up charge for #{@user.email}"
      )
      AppMailer.send_welcome_email(@user).deliver
      flash[:notice] = "Your account was created"
      redirect_to videos_path
    else
      flash[:danger] = "Invalid user information. Please check the errors below."
      render :new
    end
    
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def handle_invitaiton
    if params[:invitation_token].present?
        invitation = Invitation.find_by(token: params[:invitation_token])
        @user.follow(invitation.inviter)
        invitation.inviter.follow(@user)
        invitation.update_column(:token, nil)
      end
  end

end