require 'spec_helper'

feature 'sending email notifications', %q{
  I am notified whenever a new review is posted
  for my article
} do

  # Acceptance Criteria:
  # I am sent an email when my article has been reviewed by another.
  # The body of the email contains a link to the review

  scenario 'An email notification is sent for a new review' do

  end

  scenario 'An email notification is sent for a new comment' do

  end

end
