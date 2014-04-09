require 'spec_helper'

feature 'user can create a comment for a specific review', %Q{
  As a authorized user
  I want to comment on a specific review
  so that my opinions are heard
  } do

  scenario 'successfully adds a comment' do
    visit root_path
    user = FactoryGirl.create(:user)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    review = FactoryGirl.create(:review)
    comment = FactoryGirl.create(:comment)
    pre_count = Comment.count
    visit review_path(review)
    click_on "Add a Comment"
    fill_in 'Body', with: comment.body
    click_on 'Submit Comment'

    expect(page).to have_content 'Comment was successfully added'
    expect(page).to have_content(comment.body)
    expect(Comment.count).to eq(pre_count + 1)
  end

end
