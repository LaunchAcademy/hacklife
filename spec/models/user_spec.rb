require 'spec_helper'

describe User do
  it { should have_valid(:name).when("Johnny Rotten") }
  it { should_not have_valid(:name).when(nil, '') }
  it { should have_valid(:username).when("Vandango") }
  it { should_not have_valid(:username).when(nil, '') }
  it { should allow_value(true, false).for(:admin) }
  it { should_not have_valid(:admin).when(nil,'') }

  describe 'admin function' do
    it 'is not an admin if the the user field is false' do
      admin = FactoryGirl.create(:user)
      expect(admin.admin?).to_not be_true
    end

    it 'is an admin if the user field is true' do
      admin = FactoryGirl.create(:user, admin: true)
      expect(admin.admin?).to be_true
    end
  end
end
