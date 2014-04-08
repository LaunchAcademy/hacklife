FactoryGirl.define do

  factory :user do
    name 'Sterling Archer'
    sequence :username do |u|
      "blackturtleneck#{u}"
    end
    sequence :email do |e|
      "spy#{e}@isis.com"
    end
    password 'password'
    password_confirmation 'password'
  end
  
  factory :life_hack do
    link "www.lifehacker.com"
    sequence(:title){ |n| "how to make a great site #{n}" }
    content "it's so easy to create an awesome site"
    user
  end

end
