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
      likes = 0
      visit review_path(review)
      click_button 'Like'

      expect(page).to have_content 'Review liked!'
      expect(likes).to eq (likes + 1)
    end
  end

end
