FactoryGirl.define do

  factory :life_hack do
    link 'www.lifehacker.com'
    title 'how to make a great site'
    content "it's so easy to create an awesome site"
  end
  
  factory :user do
    name 'Sterling Archer'
    username 'blackturtleneck'
    email 'spy@isis.com'
    password 'password'
    password_confirmation 'password'
  end

end
