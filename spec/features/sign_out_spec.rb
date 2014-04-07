require 'spec_helper'

feature 'user signs out' , %Q{
  As a signed in user
  I want to sign out
  so weird people can't impersonate me
  } do
  
  scenario 'Logged in user signs out' do

    visit root_path
    user = FactoryGirl.create(:user)
    click_link "Sign In"
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password

    click_on "Sign in"
    
    click_link "Sign Out"
    expect(page).to have_content("Sign In")

  end
  
end