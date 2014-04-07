require 'spec_helper'


feature 'user can create a review for a specific article', %Q{As a user
  I want to create a review for a specific article
  } do

   # ACCEPTANCE CRITERIA
  # I can write a title and body for the review
  # I can select a rating from 1 to 5 for the article
  # I am redirected towards the index page after I submit an article_1

  scenario 'successfully adds a review' do
    life_hack = FactoryGirl.create(:life_hack)
    pre_count = Review.count
    visit life_hack_path(life_hack)
    save_and_open_page
    click_on "Add a Review"
    fill_in 'Title', with: 'This article is DA BOMB!'
    fill_in 'Body', with: "This is the best article I've ever read"
    choose 'Rating', with: 1
    click_on 'Submit Review'

    expect(page).to have_content 'Review was successfully added'
    expect(page).to have_content 'This article is DA BOMB!'
    expect(Review.count).to eq(pre_count + 1)
  end

  scenario 'enters invalid review' do
    life_hack = FactoryGirl.create(:life_hack)
    pre_count = Review.count
    visit life_hack_path(life_hack)
    click_on "Add a Review"
    click_on 'Submit Review'

    expect(page).to have_content "can't be blank"
    expect(LifeHack.count).to eq(pre_count)
  end
end
