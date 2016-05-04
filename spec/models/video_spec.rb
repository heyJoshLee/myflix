require "spec_helper"

describe Video do
  it "saves itself" do
    video = Video.new(title: "Monk", description: "Great")
    video.save
    expect(Video.first).to eq(video)
  end
end
