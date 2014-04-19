# Configuration filer for mailcather gem
# Mail generated can be viewed on http://127.0.0.1:1080
if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtip_settings = {
    address: "localhost",
    port: 1025
  }
end
