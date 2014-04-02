require 'spec_helper'

feature 'user selects a lifehack article for viewing', %Q{As a user
  I want to select a lifehack
  so I can view it and read its
  contents
  } do

   # ACCEPTANCE CRITERIA
  # I can select an individual article by title
  # I am redirected towards the article's specific page

   # article_2 = FactoryGirl.create(:life_hack)
   # article_3 = FactoryGirl.create(:life_hack)

  scenario 'selects a lifehack article for view' do
    article_1 = FactoryGirl.create(:life_hack)
    visit life_hacks_path
    click_link article_1[:title]
    expect(page).to have_content(article_1[:title])
    expect(page).to have_content(article_1[:content])
  end
end

feature 'user can create a review for a specific article', %Q{As a user
  I want to create a review for a specific article
  } do

   # ACCEPTANCE CRITERIA
  # I can write a title and body for the review
  # I can select a rating from 1 to 5 for the article
  # I am redirected towards the index page after I submit an article_1

  cenario 'successfully adds a review' do
    pre_count = Review.count
    visit new_life_hack_path
    fill_in 'Title', with: 'This article is DA BOMB!'
    fill_in 'Body', with: "This is the best article I've ever read"
    select 'Rating', with: 1

    click_on 'Submit Hack'

    expect(page).to have_content 'LifeHack was successfully added'
    expect(page).to have_content 'how to hack'
    expect(LifeHack.count).to eq(pre_count + 1)
  end

  # scenario 'enters invalid review' do
  #   pre_count = Review.count
  #   visit new_life_hack_path

  #   click_on 'Submit Hack'

  #   expect(page).to have_content "can't be blank"
  #   expect(LifeHack.count).to eq(pre_count)
  # end
end
