require 'spec_helper'

describe LifeHack do

    it { should have_valid(:title).when('Hacking the USA') }
    it { should_not have_valid(:title).when(nil, 12, '') }

    it { should have_valid(:link).when('www.howtohacktheusa.com') }
    it { should_not have_valid(:link).when('www.com') }

    it { should have_valid(:content).when('Here\'s how to hack America') }
    it { should_not have_valid(:content).when(nil, '') }

end
