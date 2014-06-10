require 'spec_helper'

describe "animals/new" do
  before(:each) do
    assign(:animal, stub_model(Animal,
      :name => "MyString",
      :sex => "MyString",
      :organisation => nil,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new animal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", animals_path, "post" do
      assert_select "input#animal_name[name=?]", "animal[name]"
      assert_select "input#animal_sex[name=?]", "animal[sex]"
      assert_select "input#animal_organisation[name=?]", "animal[organisation]"
      assert_select "textarea#animal_description[name=?]", "animal[description]"
    end
  end
end
