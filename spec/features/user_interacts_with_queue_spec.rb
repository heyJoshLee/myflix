require "spec_helper"

feature "User interacts with the queue" do

  scenario "User adds and reorders video in the queue" do
    comedies = Fabricate(:category)
    monk = Fabricate(:video, title: "Monk", category_id: comedies.id)
    south_park = Fabricate(:video, title: "South Park", category_id: comedies.id)
    futurama = Fabricate(:video, title: "Futurama", category_id: comedies.id)

    sign_in

    add_video_to_queue(monk)
    add_video_to_queue(south_park)
    add_video_to_queue(futurama)

    within(:xpath, "//tr[contains(.,'#{monk.title}')]") do
      fill_in "queue_items[][position]", with: 3
    end

    set_video_position(south_park, 1)
    set_video_position(futurama, 2)

    click_button "Update Instant Queue"

    expect(find(:xpath, "//tr[contains(., '#{monk.title}')]//input[@type='text']").value).to eq("3")
    expect_video_position(south_park, "1")
    expect_video_position(futurama, "2")

  end

end


def add_video_to_queue(video)
   visit home_path
  find("a[href='/videos/#{video.id}']").click
  click_link "+ My Queue"
end

def set_video_position(video, position)
  find("input[data-video-id='#{video.id}']").set(position)
end

def expect_video_position(video, position)
  expect(find("input[data-video-id='#{video.id}']").value).to eq(position)
end

