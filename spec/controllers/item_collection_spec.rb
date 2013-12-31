require 'spec_helper'

describe 'item collections', :js => true do
  it 'Listing item collections' do
    visit '/'
    page.should have_content('Listing Item Collections')
  end

  it 'Creating a new item collection' do
  	visit '/item_collections/new'
    title = 'Item collection 1'
    fill_in 'item_collection_title', :with => title
    fill_in 'item_collection_description', :with => 'Item collection description'
    click_on 'submit'  # this be an Ajax button -- requires Selenium
    page.should have_content('Item collection was successfully created.')
    page.should have_content(title)
  end

  it 'Show item collection' do
    item_collection = create(:item_collection)
    visit '/item_collections/'+ (item_collection.id).to_s
    page.should have_content(item_collection.title)
  end

  it 'Edit item collection' do
    item_collection = create(:item_collection)
    visit '/item_collections/'+ item_collection.id.to_s + '/edit'
    page.should have_content('Editing Item Collection')
  end

end