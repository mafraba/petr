require 'spec_helper'

describe "animals/index" do
  before(:each) do
    assign(:animals, [
      stub_model(Animal,
        :name => "Name",
        :sex => "Sex",
        :organisation => nil,
        :description => "MyText"
      ),
      stub_model(Animal,
        :name => "Name",
        :sex => "Sex",
        :organisation => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of animals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
