require 'spec_helper'

describe Comment do

  it { should have_valid(:body).when('I am awesome') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should belong_to(:user) }
  it { should belong_to(:review) }
end
