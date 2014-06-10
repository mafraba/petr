require 'spec_helper'

describe "animals/show" do
  before(:each) do
    @animal = assign(:animal, stub_model(Animal,
      :name => "Name",
      :sex => "Sex",
      :organisation => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Sex/)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
