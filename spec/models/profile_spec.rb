require 'spec_helper'

describe Profile do
  
  it { should belong_to(:organisation) }
  it { should validate_presence_of(:organisation) }
  
end
