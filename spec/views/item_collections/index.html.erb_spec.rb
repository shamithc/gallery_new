require 'spec_helper'

describe "item_collections/index" do
  before(:each) do
    assign(:item_collections, [
      stub_model(ItemCollection,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(ItemCollection,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of item_collections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
