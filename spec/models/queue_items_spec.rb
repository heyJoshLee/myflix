require "spec_helper"


describe QueueItem do
  it { should belong_to(:user) }
  it { should belong_to(:video) }

  describe "#video_title" do
    it "returns the title of the associated video" do
      video = Fabricate(:video, title: "My title")
      queue_item = Fabricate(:queue_item, video: video)
      expect(queue_item.video_title).to eq("My title")
    end
  end

  describe "#rating" do
    it "returns the rating from the review when the rating it present" do
      video = Fabricate(:video, title: "My title")
      user = Fabricate(:user)
      review = Fabricate(:review, user: user, video: video, rating: 1)
      queue_item = Fabricate(:queue_item, user: user, video: video)
      expect(queue_item.rating).to eq(1)
    end
    it "returns nil when the rating isn't present" do
      video = Fabricate(:video, title: "My title")
      user = Fabricate(:user)
      queue_item = Fabricate(:queue_item, user: user, video: video)
      expect(queue_item.rating).to eq(nil)
    end
  end

  describe "#category_name" do
    it "returns the category's name of the video" do
      category = Fabricate(:category, name: "comedies")
      video = Fabricate(:video, category_id: category.id)
      queue_item = Fabricate(:queue_item, video: video)
      expect(queue_item.category_name).to eq("comedies")
    end
  end

  describe "#category" do
    it "returns the category of the video" do
      category = Fabricate(:category, name: "comedies")
      video = Fabricate(:video, category_id: category.id)
      queue_item = Fabricate(:queue_item, video: video)
      expect(queue_item.category).to eq(category)
    end
  end

end