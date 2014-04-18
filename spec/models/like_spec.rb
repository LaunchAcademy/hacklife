require 'spec_helper'

describe Like do

  it { should have_valid(:score).when(-1,1) }
  it { should_not have_valid(:score).when(nil,'',89) }

  it { should belong_to(:user)}
  it { should belong_to(:review)}
end
