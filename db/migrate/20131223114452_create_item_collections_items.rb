class CreateItemCollectionsItems < ActiveRecord::Migration
  def change
    create_table :item_collections_items do |t|
    	t.belongs_to :item
        t.belongs_to :item_collection
    end
  end
end
