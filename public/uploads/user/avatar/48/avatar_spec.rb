require 'spec_helper'

feature 'user can have avatar' , %Q{
  As an unauthenticated user
  I want to sign up with an avatar
  so that other people can see how cool I am
  } do
  
  scenario 'sign up with avatar file' do
    visit root_path
    click_link "Sign Up"
    fill_in "Name", with: "Bilbo Baggins" 
    fill_in "Username", with: "dragonburglar"
    fill_in "Email", with: "dragonburglar@gmail.com"
    file_path = 'spec/features/wizard.png'
    attach_file('user_avatar', file_path)
    fill_in 'user_password', with: "password"
    fill_in "Password confirmation", with: "password"
    
    click_on "Sign Up"
    
    expect(page).to have_content("You're In!")
    expect(page).to have_css('img', 'Wizard')   
  end
  scenario 'Sign up not allowed with invalid image file' do
    visit root_path
    click_link "Sign Up"
    fill_in "Name", with: "Bilbo Baggins" 
    fill_in "Username", with: "dragonburglar"
    fill_in "Email", with: "dragonburglar@gmail.com"
    file_path = 'spec/features/avatar_spec.rb'
    attach_file('user_avatar', file_path)
    fill_in 'user_password', with: "password"
    fill_in "Password confirmation", with: "password"
    
    click_on "Sign Up"
    
    expect(page).to have_content("can't be blank")

  end
  
  
end