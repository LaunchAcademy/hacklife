require "spec_helper"

describe ReviewMailer do
  describe "notify" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { ReviewMailer.notify(user) }

    it "renders the headers" do
      mail.subject.should eq("New Life Hack Review!")
      mail.to.should eq([user.email])
      mail.from.should eq(["admin@hacklife.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Your Life Hack has been reviewed!")
    end
  end

end
