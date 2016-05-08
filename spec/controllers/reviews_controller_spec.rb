require "spec_helper"

describe ReviewsController do
  describe "POST create" do
    context "with authenticated users" do
      context "with valid inputs" do

        let(:video) { Fabricate(:video) }
        let(:user) { Fabricate(:user) }

        before do
          session[:user_id] = user.id
        end

        before do
          post :create, review: Fabricate.attributes_for(:review, user: user ), video_id: video.id
        end

         it "should create review" do
          expect(Review.count).to eq(1)
        end

        it "redirects to the video show page" do
          expect(response).to redirect_to video
        end

        it "creates a reviews associated with the video" do
         expect(Review.first.video).to eq(video)
        end

        it "creates review associated with the signed in user" do
          expect(Review.first.user.id).to eq(user.id)
        end
      end

      context "with invalid inputs" do
        let(:video) { Fabricate(:video) }
        let(:user) { Fabricate(:user) }

         before do
          session[:user_id] = user.id
        end

        it "does not create a review" do
          post :create, review: {rating: 4}, video_id: video.id
          expect(Review.count).to eq(0)
        end

        it "renders the videos/show template" do
          post :create, review: {rating: 4}, video_id: video.id
          expect(response).to render_template "show"
        end

        it "sets @video" do
          post :create, review: { rating: 4}, video_id: video.id
          expect(assigns(:video)).to eq(video)
        end

        it "sets @reviews" do
          review = Fabricate(:review, video: video)
          post :create, review: { rating: 4}, video_id: video.id
          expect(assigns(:reviews)).to match_array([review])
        end

      end

    end

    context "with unauthenticated users" do
      it "redirects to sign in page" do
        video = Fabricate(:video)
        post :create, review: { rating: 4}, video_id: video.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end