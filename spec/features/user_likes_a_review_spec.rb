require 'spec_helper'

feature 'user can like a specific review for a lifehack', %q{
  As an authenticated user
  I can like or dislike a review
  so other users can view which reviews are better
} do

  context 'as an authenticated user' do

    let(:user){ FactoryGirl.create(:user) }
    let(:life_hack){ FactoryGirl.create(:life_hack) }
    let(:review){ FactoryGirl.create(:review) }

    before :each do
      sign_in_as(user)
    end


    scenario 'successfully likes a review' do

      visit review_path(review)
      click_button 'Like'


      expect(page).to have_content 'You Voted!'
      expect(user.likes.find_by(review: review).score).to eq(1)
    end


    scenario 'successfully dislikes a review' do

      visit review_path(review)
      click_button 'Dislike'

      expect(page).to have_content 'You Voted!'
      expect(user.likes.find_by(review: review).score).to eq(-1)
    end

    scenario 'user updates vote' do

      visit review_path(review)
      click_button 'Dislike'
      click_button 'Like'

      expect(page).to have_content 'Updated'
    end

    scenario 'user tries to vote with same score again' do

      visit review_path(review)
      click_button 'Like'
      click_button 'Like'

      expect(page).to have_content 'Vote failed.'
    end


  end
end
