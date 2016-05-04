require "spec_helper"

describe Video do
  it "saves itself" do
    video = Video.new(title: "Monk", description: "Great")
    video.save
    expect(Video.first).to eq(video)
  end

  it "belongs to category" do
    dramas = Category.create(name: "dramas")
    video = Video.create(title: "Monk", description: "Great", category: dramas)
    expect(video.category).to eq(dramas)
  end
end
