require 'spec_helper'

feature 'add delete functionality', %q{
  As an authenticated user and an authorized administrator,
  I want to have the capability to remove articles that are innappropriate.
} do

  #Acceptance Criteria:
  # I must be authenticated and authorized to be able to destroy an article.
  # By clicking on Delete, I am able to remove an article from the page.
  # If I am not authenticated nor authorized, then I am unable to delete an article.

  scenario 'I am able to delete an article with all associated reviews and comments as an authorized admin' do
    admin = FactoryGirl.create(:user, admin:true)
    sign_in_as(admin)
    life_hack = FactoryGirl.create(:life_hack)
    previous_count = LifeHack.count
    visit life_hack_path(life_hack)
    click_on "Delete"
    expect(page).to have_content("Article Deleted")
    expect(LifeHack.count).to eql(previous_count - 1)
  end

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
