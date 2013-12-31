require 'spec_helper'

describe "item_collections/new" do
  before(:each) do
    assign(:item_collection, stub_model(ItemCollection,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new item_collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_collections_path, "post" do
      assert_select "input#item_collection_title[name=?]", "item_collection[title]"
      assert_select "textarea#item_collection_description[name=?]", "item_collection[description]"
    end
  end
end
