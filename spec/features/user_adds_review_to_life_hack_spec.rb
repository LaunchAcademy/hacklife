require 'spec_helper'


feature 'user can create a review for a specific article', %Q{As a user
  I want to create a review for a specific article
  } do

  scenario 'successfully adds a review' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link "Sign In"
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password
    click_on "Sign in"
    
    life_hack = FactoryGirl.create(:life_hack)
    pre_count = Review.count
    visit life_hack_path(life_hack)
    click_on "Add a Review"
    fill_in 'Title', with: 'This article is DA BOMB!'
    fill_in 'Body', with: "This is the best article I've ever read"
    choose 1
    
    click_on 'Submit Review'

    expect(page).to have_content 'Review was successfully added'
    expect(page).to have_content 'This article is DA BOMB!'
    expect(Review.count).to eq(pre_count + 1)
  end

  scenario 'enters invalid review' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link "Sign In"
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password
    click_on "Sign in"
    
    archer = FactoryGirl.create(:user)
    life_hack = FactoryGirl.create(:life_hack)
    pre_count = Review.count
    visit life_hack_path(life_hack)
    click_on "Add a Review"
    click_on 'Submit Review'

    expect(page).to have_content "can't be blank"
    expect(Review.count).to eq(pre_count)
  end
end
