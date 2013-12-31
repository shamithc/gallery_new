require 'spec_helper'

describe "item_collections/show" do
  before(:each) do
    @item_collection = assign(:item_collection, stub_model(ItemCollection,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
