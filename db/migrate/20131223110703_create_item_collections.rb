class CreateItemCollections < ActiveRecord::Migration
  def change
    create_table :item_collections do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
