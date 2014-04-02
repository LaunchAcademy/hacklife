FactoryGirl.define do

  factory :life_hack do
    link "www.lifehacker.com"
    sequence(:title){ |n| "how to make a great site #{n}" }
    content "it's so easy to create an awesome site"
  end
end
