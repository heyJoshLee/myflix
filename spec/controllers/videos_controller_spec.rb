require "spec_helper"

describe VideosController do

  describe "GET show" do

    let(:futurama) { Fabricate(:video, title: "Futurama")}

    it "sets @video for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :show, id: futurama.id
      expect(assigns(:video)).to eq(futurama)
    end

    it "sets @reviews for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      review1 = Fabricate(:review, video: futurama)
      review2 = Fabricate(:review, video: futurama)
      get :show, id: futurama.id
      assigns(:reviews).should match_array([review1, review2])
    end

    it "redirects the user to the  sign in page for unauthenticated users" do
      get :show, id: futurama.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST search" do
    let(:futurama) { Fabricate(:video, title: "Futurama")}


    it "sets @results for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :search, search_term: "F"
      expect(assigns(:results)).to eq([futurama])
    end

    it "redirects to sign in page for unauthenticated users" do
      get :search, search_term: "rama"
      expect(response).to redirect_to sign_in_path
    end

  end

end