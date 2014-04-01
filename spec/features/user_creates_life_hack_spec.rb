require 'spec_helper'

feature 'user adds a lifehack', %Q{As a user
I want to post a lifehack
so I can share with others
} do
	
# Acceptance Criteria
# * User should be able to go to a page to create a new lifehack
# * User should be able to enter a title, text/link, optional picture
# * User should be able to click submit
# *Lifehack should appear when redirected to home page

scenario 'successfully adds a lifehack' do
	visit '/life_hack/new'

	fill_in 'Link', with: 'www.lifehack.com'
	fill_in 'Title', with: "how to hack"
	fill_in 'Content', with: "This is how you hack"

	click_on 'Submit LifeHack'

	expect(page).to have_content 'LifeHack was successfully added'
	expect(page).to have_content 'how to hack'

	end
end



