require 'spec_helper'

feature 'user signs up' , %Q{
  As an unauthenticated user
  I want to sign up
  so that I can submit and review site content
  } do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link "Sign Up"
    fill_in "Name", with: "Bilbo Baggins"
    fill_in "Username", with: "dragonburglar"
    fill_in "Email", with: "dragonburglar@gmail.com"
    fill_in 'user_password', with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign Up"

    expect(page).to have_content("You're In!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'requested information is not specified' do
    visit root_path
    click_link "Sign Up"
    click_on 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario 'signs up with previously assigned email' do
    visit root_path
    click_link "Sign Up"
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    click_on 'Sign Up'

    expect(page).to have_content('has already been taken')
  end

  scenario 'signs up with a previously assigned username' do
    visit root_path
    click_link "Sign Up"
    user = FactoryGirl.create(:user)
    fill_in 'Username', with: user.username
    click_on 'Sign Up'

    expect(page).to have_content('has already been taken')
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link "Sign Up"
    fill_in 'user_password', with: 'imapassword'
    fill_in 'Password confirmation', with: 'imnotapassword'
    click_on 'Sign Up'

    expect(page).to have_content("doesn't match Password")
  end

end
