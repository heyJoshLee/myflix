require "spec_helper"

describe Category do

  it "saves itself" do
    category = Category.new(name:  "Comedies")
    category.save
    expect(Category.first).to eq(category)
  end

  it "has many videos" do
    comedies = Category.create(name:  "Comedies")
    south_park = Video.create(title: "south park", description: "Very funny", category: comedies)
    monk = Video.create(title: "Monk ", description: "NOt a good show", category: comedies)

    expect(comedies.videos).to eq([monk, south_park])
  end

end