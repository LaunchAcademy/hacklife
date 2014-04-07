require 'spec_helper'

feature 'user signs in' , %Q{
  As an registered user
  I want to sign in
  so that I can submit and review site content
  } do
  
  scenario 'specifying valid and required information' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link "Sign In"
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password

    click_on "Sign in"
    
    expect(page).to have_content("You're In!")
    expect(page).to have_content("Sign Out")    
    
  end
  scenario 'User entering wrong information is given error message and asked to enter correct info' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link "Sign In"
    fill_in "Email", with: user.email 
    fill_in "Password", with: "WRONG"

    click_on "Sign in"
    expect(page).to_not have_content("You're In!")
    expect(page).to have_content("Invalid email or password.")    
    
  end
  
end