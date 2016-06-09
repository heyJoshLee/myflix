require "spec_helper"

describe ForgotPasswordsController do
  describe "POST create" do
    context "with blank input" do

      before do
        post :create, email: ""
      end

      it "redirects to the forgot password page" do
        expect(response).to redirect_to forgot_password_path
      end

      it "shows an error message" do
        expect(flash[:error]).to eq("Email cannot be blank")
      end
    end

    context "with existing email" do
      it "redirect to the forgot password confirmation page" do
        user = Fabricate(:user, email: "alice@example.com")
        post :create, email: "alice@example.com"
        expect(response).to redirect_to password_confirmation_path
      end

      it "sends out email to the email address" do
        user = Fabricate(:user, email: "alice@example.com")
        post :create, email: "alice@example.com"
        expect(ActionMailer::Base.deliveries.last.to). to eq(["alice@example.com"])
      end
    end

    context "with non-existing email" do
      it "redirects to the forgot password page" do
        post :create, email: "none@example.com"
        expect(response).to redirect_to forgot_password_path
      end

      it "shows an error message" do
        post :create, email: "none@example.com"
        expect(flash[:error]).to eq("Cannot find email")
      end

    end
  end
end