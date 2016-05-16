require "spec_helper"

feature "User signs in" do
  scenario "successful sign in" do
    sign_in
    expect_to_see("You are signed in")
  end

  scenario "unsuccessful sign in" do
    visit sign_in_path
    fill_in_form_and_submit
    expect_to_see("There was something wrong with your email or password")
  end
end

def fill_in_form_and_submit
  fill_in "email",    with: "no match"
  fill_in "password", with: "no match"
  click_on "Sign in"
end