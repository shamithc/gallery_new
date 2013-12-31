require 'spec_helper'

describe 'item', :js => true do
  it 'Listing items' do
    visit '/items'
    page.should have_content('Listing items')
  end

  it 'Creating a new item collection' do
  	visit '/items/new'
    title = 'Item 1'
    fill_in 'item_title', :with => title
    click_on 'submit'  # this be an Ajax button -- requires Selenium
    page.should have_content('Item was successfully created.')
    page.should have_content(title)
  end

  it 'Show item' do
    item = create(:item)
    visit '/items/'+ (item.id).to_s
    page.should have_content(item.title)
  end

  it 'Edit item collection' do
    item = create(:item)
    visit '/items/'+ item.id.to_s + '/edit'
    page.should have_content('Editing item')
  end

end