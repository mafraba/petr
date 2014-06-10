require 'spec_helper'

describe "animals/edit" do
  before(:each) do
    @animal = assign(:animal, stub_model(Animal,
      :name => "MyString",
      :sex => "MyString",
      :organisation => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit animal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", animal_path(@animal), "post" do
      assert_select "input#animal_name[name=?]", "animal[name]"
      assert_select "input#animal_sex[name=?]", "animal[sex]"
      assert_select "input#animal_organisation[name=?]", "animal[organisation]"
      assert_select "textarea#animal_description[name=?]", "animal[description]"
    end
  end
end
