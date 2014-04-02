require 'spec_helper'

feature 'user adds a lifehack', %Q{As a user
  I want to post a lifehack
  so I can share with others
  } do

# Acceptance Criteria
# * User should be able to go to a page to create a new lifehack
# * User should be able to enter a title, text/link, optional picture
# * User should be able to click submit
# *Lifehack should appear when redirected to home page

  scenario 'successfully adds a lifehack' do
    #article_count = LifeHack.
    pre_count = LifeHack.count
    visit new_life_hack_path
    fill_in 'Link', with: 'www.lifehack.com'
    fill_in 'Title', with: "how to hack"
    fill_in 'Content', with: "This is how you hack"

    click_on 'Submit Hack'

    expect(page).to have_content 'LifeHack was successfully added'
    expect(page).to have_content 'how to hack'
    #expect(LifeHack.count).to eql(article_count + 1)
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



