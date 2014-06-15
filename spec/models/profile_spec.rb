require 'spec_helper'

describe Profile do
  
  it { should belong_to(:organisation) }
  it { should validate_presence_of(:organisation) }
  
  it "should always have a name" do
  	should validate_presence_of(:name)
  end

  it "should always have a description" do
  	should validate_presence_of(:description)
  end

end
