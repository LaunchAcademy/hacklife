require 'spec_helper'

feature 'user selects a lifehack article for viewing', %Q{As a user
  I want to select a lifehack
  so I can view it and read its
  contents
  } do

   # ACCEPTANCE CRITERIA
  # I can select an individual article by title
  # I am redirected towards the article's specific page

   # article_2 = FactoryGirl.create(:life_hack)
   # article_3 = FactoryGirl.create(:life_hack)

  scenario 'selects a lifehack article for view' do
    article_1 = FactoryGirl.create(:life_hack)
    visit life_hacks_path
    click_link article_1[:title]

    expect(page).to have_content(article_1[:content])
  end
end
