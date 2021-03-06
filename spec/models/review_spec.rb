require 'spec_helper'

describe Review do
  it { should have_valid(:title).when('Hacking the USA') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:body).when('Here\'s how to hack America') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when(1) }
  it { should_not have_valid(:rating).when(nil, '', 0, 3000, -2) }

  it { should belong_to(:life_hack) }
  it { should belong_to(:user) }

  it { should have_many(:comments).dependent(:destroy) }
end
