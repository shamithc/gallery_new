require 'spec_helper'

describe "item_collections/edit" do
  before(:each) do
    @item_collection = assign(:item_collection, stub_model(ItemCollection,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit item_collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_collection_path(@item_collection), "post" do
      assert_select "input#item_collection_title[name=?]", "item_collection[title]"
      assert_select "textarea#item_collection_description[name=?]", "item_collection[description]"
    end
  end
end
