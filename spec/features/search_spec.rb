require 'spec_helper'

feature 'user searches for lifehack' , %Q{
  As an unauthenticated user
  I want to search life hacks
  so that I can find hacks that are interesting to me
  } do

  let!(:life_hack){ FactoryGirl.create(:life_hack) }
  let!(:life_hack_2){ FactoryGirl.create(:life_hack) }

  scenario 'it returns life hacks searched for' do
    visit root_path
    fill_in "search", with: life_hack.title
    click_on "Search Life Hacks"
    
    expect(page).to have_content(life_hack.title)
    
    fill_in "search", with: life_hack.title.split(' ')[0]
    click_on "Search Life Hacks"
    expect(page).to have_content(life_hack.title)
  end

  scenario 'it does not return life hacks that are not in search terms' do
    visit root_path
    fill_in "search", with: life_hack_2.title
    click_on "Search Life Hacks"
    
    expect(page).to have_content(life_hack_2.title)
    expect(page).to_not have_content(life_hack.title)
  end
  
  scenario 'it returns matches in content as well as title' do
    # where("title like ?", "%#{search}%") to search only for title
    visit root_path
    fill_in "search", with: life_hack_2.content
    click_on "Search Life Hacks"
    
    expect(page).to have_content(life_hack_2.title)
  end
  
end