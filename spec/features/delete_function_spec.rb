require 'spec_helper'

feature 'add delete functionality', %q{
  As an authenticated user and an authorized administrator,
  I want to have the capability to remove articles that are innappropriate.
} do

  context 'removing singular objects' do
    before :each do
      admin = FactoryGirl.create(:user, admin:true)
      sign_in_as(admin)
      life_hack = FactoryGirl.create(:life_hack)
    end

    scenario 'I am able to delete an article as an authorized admin' do
      life_hack = FactoryGirl.create(:life_hack)
      previous_count = LifeHack.count
      visit life_hack_path(life_hack)
      click_on "Delete"
      expect(page).to have_content("Article Deleted")
      expect(LifeHack.count).to eql(previous_count - 1)
    end

    scenario 'I am able to delete a review as an authorized admin' do
      life_hack = FactoryGirl.create(:life_hack)
      review = FactoryGirl.create(:review, life_hack: life_hack)
      review_previous_count = Review.count
      visit review_path(review)
      click_on "Delete"
      expect(page).to have_content("Review Deleted")
      expect(Review.count).to eql(review_previous_count - 1)
    end

    scenario 'I am able to delete a comment as an authorized admin' do
      life_hack = FactoryGirl.create(:life_hack)
      review = FactoryGirl.create(:review, life_hack:
        life_hack)
      comment = FactoryGirl.create(:comment, review: review)
      review_previous_count = Review.count
      comment_previous_count = Comment.count
      visit review_path(review)
      click_on "Delete Comment"
      expect(page).to have_content("Comment Deleted")
      expect(Comment.count).to eql(comment_previous_count - 1)
    end

  end

  context 'associations' do
    scenario 'I am able to delete an article with all associated reviews' do
      admin = FactoryGirl.create(:user, admin:true)
      sign_in_as(admin)
      life_hack = FactoryGirl.create(:life_hack, user: admin)
      review = FactoryGirl.create(:review, life_hack: life_hack)
      life_hack_previous_count = LifeHack.count
      review_previous_count = Review.count
      visit life_hack_path(life_hack)
      click_on "Delete"
      expect(page).to have_content("Article Deleted")
      expect(LifeHack.count).to eql(life_hack_previous_count - 1)
      expect(Review.count).to eql(review_previous_count - 1)
    end

    scenario 'I am able to delete an article with all associated reviews and comments' do
      admin = FactoryGirl.create(:user, admin:true)
      sign_in_as(admin)
      life_hack = FactoryGirl.create(:life_hack, user: admin)
      review = FactoryGirl.create(:review, life_hack: life_hack)
      comment = FactoryGirl.create(:comment, review: review)
      life_hack_previous_count = LifeHack.count
      comment_previous_count = Comment.count
      visit life_hack_path(life_hack)
      click_on "Delete"
      expect(page).to have_content("Article Deleted")
      expect(LifeHack.count).to eql(life_hack_previous_count - 1)
      expect(Comment.count).to eql(comment_previous_count - 1)
    end
  end

  context 'invalid authorization' do
    scenario 'I am unable to delete an article without admin status' do
      not_admin = FactoryGirl.create(:user)
      sign_in_as(not_admin)
      life_hack = FactoryGirl.create(:life_hack)
      previous_count = LifeHack.count
      visit life_hack_path(life_hack)
      expect(page).to_not have_content("Delete")
      expect(LifeHack.count).to_not eql(previous_count + 1)
    end
  end
end
