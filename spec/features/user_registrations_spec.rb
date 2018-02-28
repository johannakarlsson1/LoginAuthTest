require 'rails_helper'

RSpec.feature "user registration", type: :feature do
  it "successful registration" do
    # visit the registration page
    visit '/register'
    # fill in the username and password
    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    # click submit
    click_button 'Create'
    # expect: to see homepage
    expect(page).to have_content "Title"
    # expect: to see welcome username
    expect(page).to have_content "Welcome username"
  end
  it "short password"
end
