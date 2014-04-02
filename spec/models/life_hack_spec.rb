require 'spec_helper'

describe LifeHack do

  it { should have_valid(:title).when('Hacking the USA') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:content).when('Here\'s how to hack America') }
  it { should_not have_valid(:content).when(nil, '') }

end
