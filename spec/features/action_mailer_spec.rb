require 'spec_helper'

feature 'sending email notifications', %q{
  I am notified whenever a new review is posted
  for my article
} do

  # Acceptance Criteria:
  # I am sent an email when my article has been reviewed by another.
  # The body of the email contains a link to the review


  scenario 'An email notification is sent for a new review' do
    ActionMailer::Base.deliveries = []
    life_hack = FactoryGirl.create(:life_hack)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    prev_count = Review.count
    visit life_hack_path(life_hack)
    click_on "Add a Review"
    fill_in 'Title', with: 'This article is DA BOMB!'
    fill_in 'Body', with: "This is the best article I've ever read"
    choose 1
    click_on 'Submit Review'

    expect(page).to have_content('Review was successfully added')
    expect(Review.count).to eql(prev_count + 1)
    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('New Life Hack Review!')
    expect(last_email).should deliver_to('spy1@isis.com')
    expect(last_email).to have_body_text('Your Life Hack has been reviewed!')
  end
end
