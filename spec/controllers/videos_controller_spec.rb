require "spec_helper"

describe VideosController do

  describe "GET show" do

    let(:video) { Video.create(title: "hi there", description: "hi mom")}

    it "sets @video for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "redirects the user to the  sign in page for unauthenticated users" do
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "POST search" do
    it "sets @results for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: "Futurama")
      get :search, search_term: "F"
      expect(assigns(:results)).to include([futurama])
    end

    describe "it redirects to sign in page for unauthenticated users" do
      # futurama = Fabricate(:video, title: "Futurama")
      # get :search, search_term: "rama"
      # expect(response).to redirect_to sign_in_path
    end

  end

end