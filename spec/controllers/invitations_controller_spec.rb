require "spec_helper"

describe InvitationsController do

  describe "GET new" do
    it "sets @invitations to a new invitation" do
      set_current_user
      get :new
      expect(assigns(:invitation)).to be_new_record
      expect(assigns(:invitation)).to be_instance_of Invitation
    end
    it_behaves_like "requires sign in" do
      let(:action) { get :new}
    end
  end


  describe "POST create" do
    it_behaves_like "requires sign in" do
      let(:action) {post :create}
    end

    context "with valid inputs" do

      before do
        set_current_user
        post :create, invitation: {recipient_name: "Joe Smith", recipient_email: "joe@example.com", message: "Hey join this cool site" }
      end

      after do
        ActionMailer::Base.deliveries.clear
      end

      it "redirects to the new invitation page" do
        expect(response).to redirect_to new_invitation_path
      end

      it "creates an invitation" do
        expect(Invitation.count).to eq(1)
      end

      it "sends an email to the recipient" do
        expect(ActionMailer::Base.deliveries.last.to).to eq(["joe@example.com"])
      end

      it "sets the flash success message" do
        expect(flash[:success]).to be_present
      end

    end

    context "with invalid  input" do

      after do
        ActionMailer::Base.deliveries.clear
      end

      before do
        set_current_user
        post :create, invitation: {recipient_email: "joe@example.com", message: "Hey join this cool site" }
      end

      it "renders  the :new template" do
        set_current_user
        post :create, invitation: {recipient_email: "joe@example.com", message: "Hey join this cool site" }
        expect(response).to render_template :new
      end

      it "does not create invitation" do
        expect(Invitation.count).to eq(0)
      end

      it "does not send an email" do
        expect(ActionMailer::Base.deliveries).to be_empty
      end
      it "sets the flash error message" do
        expect(flash[:error]).to be_present
      end
      it "sets @invitation" do
        expect(assigns(:invitation)).to be_present
      end
    end
  end


end