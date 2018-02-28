require 'rails_helper'

RSpec.feature "user registration", type: :feature do
  before(:each) do
    visit register_path
  end
  it "successful registration" do
    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'

    ["Title", "Welcome username"].each do |phrase|
      expect(page).to have_content phrase
    end
  end

  it "short password" do
    fill_in 'Username', with: 'username'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'
    click_button 'Create User'
    expect(page).to have_content "Password is too short"
  end

  it "passwords don't match" do
  fill_in 'Username', with: 'username'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'notmatching'
  click_button 'Create User'
  save_and_open_page
  expect(page).to have_content "Password confirmation doesn't match Password"
end

end
