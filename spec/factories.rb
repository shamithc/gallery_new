FactoryGirl.define do
  factory :item do
    title 'Item_default'
  end

  factory :item_collection do
    title 'Default Title'
    description 'Default description'
  end
end