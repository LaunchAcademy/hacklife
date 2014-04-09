require 'spec_helper'

feature 'user signs out' , %Q{
  As a signed in user
  I want to sign out
  so weird people can't impersonate me
  } do
  
  context 'as an authenticated user' do

    let(:user){ FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'User signs out' do
      
      click_link "Sign Out"
      expect(page).to have_content("Sign In")

    end
  end
end