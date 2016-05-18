def sign_in(a_user=nil) 
  user = a_user || Fabricate(:user)
  visit sign_in_path
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  click_button "Sign in"
end

def expect_to_see(text)
  expect(page).to have_content text
end

def click_on_video_on_home_page(video)
 find("a[href='/videos/#{video.id}']").click
end

def add_video_to_queue(video)
  visit home_path
  click_on_video_on_home_page(video)
  click_link "+ My Queue"
end