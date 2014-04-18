require 'spec_helper'

feature 'user adds a lifehack', %Q{
  As a user
  I want to post a lifehack
  so I can share with others
  } do


    context 'as an authenticated user' do

    given(:user){ FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'successfully adds a lifehack' do

      pre_count = LifeHack.count
      visit new_life_hack_path
      fill_in 'Link', with: 'www.lifehack.com'
      fill_in 'Title', with: "how to hack"
      fill_in 'Content', with: "This is how you hack"

      click_on 'Submit Hack'

      expect(page).to have_content 'LifeHack was successfully added'
      expect(page).to have_content 'how to hack'
      expect(LifeHack.count).to eq(pre_count + 1)
    end

    scenario 'enters invalid lifehack' do

      pre_count = LifeHack.count
      visit new_life_hack_path

      click_on 'Submit Hack'

      expect(page).to have_content "can't be blank"
      expect(LifeHack.count).to eq(pre_count)
    end
  end
end



