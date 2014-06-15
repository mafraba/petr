require 'spec_helper'

describe Organisation do
  
  it { should have_many(:animals) }
  it { should have_one(:profile) }

  it "should automatically create a profile" do  	
  	org = FactoryGirl.build(:organisation) # not saved yet
  	# Profile not created yet
  	expect(Profile.where(organisation: org)).not_to exist
  	org.save
  	# Profile should have been auto-created
  	expect(Profile.where(organisation: org)).to exist
  end
end
