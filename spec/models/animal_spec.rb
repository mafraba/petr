require 'spec_helper'

describe Animal do

  # It should always belong to an organisation
  it { should belong_to(:organisation) }
  it { should validate_presence_of(:organisation) }
  
  it "should always have a name" do
  	should validate_presence_of(:name)
  end

  it "should always have a sex" do
  	should validate_presence_of(:sex)
  end

  it "should either be male or female" do
  	should ensure_inclusion_of(:sex).in_array(%w( male female ))
  end

  it "should always have a birth date" do
  	should validate_presence_of(:birthdate)
  end

  it "should always have a birth description" do
  	should validate_presence_of(:description)
  end

end
