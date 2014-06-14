require 'spec_helper'

describe "animals/show.html.haml" do
  it "does not contain notices" do
    assign(:animal, FactoryGirl.create(:animal))

    render

    expect(rendered).not_to have_selector('#notice')
  end
end
