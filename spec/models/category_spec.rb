require "spec_helper"

describe Category do
  it { should have_many(:videos) }
  it { should validate_presence_of(:name) }

  describe "#recent_videos" do
    
    it "returns the videos in the reverse chronological order by created_at" do
      comedies = Category.create(name: "Categories")
      futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies, created_at: 1.day.ago)
      back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel", category: comedies)
      expect(comedies.recent_videos).to eq([back_to_the_future, futurama])
    end

    it "returns all the videos if there are less than six videos" do
      comedies = Category.create(name: "Categories")
      futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies, created_at: 1.day.ago)
      back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel", category: comedies)
      expect(comedies.recent_videos.size).to eq(2)
    end

    it "returns six videos it there are  more than six videos" do
      comedies = Category.create(name: "Categories")
      7.times { Video.create(title: "foo", description: "bar", category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end

    it "returns the most recent six videos" do
      comedies = Category.create(name: "Categories")
      6.times { Video.create(title: "foo", description: "bar", category: comedies)}
      tonights_show = Video.create(title: "Tonight's show", description: "A show tonight", category: comedies, created_at: 1.day.ago)
      expect(comedies.recent_videos).not_to include(tonights_show)

    end

    it "returns an empty array if the category does not have any videos" do
      comedies = Category.create(name: "Categories")

      expect(comedies.recent_videos).to eq([])
    end
  end

end