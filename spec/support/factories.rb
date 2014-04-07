FactoryGirl.define do

  factory :life_hack do
    link 'www.lifehacker.com'
    title 'how to make a great site'
    content "it's so easy to create an awesome site"
  end
  
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

end
