class AddDigitalLinkIndexToProductKeys < ActiveRecord::Migration
  def change
    add_column :spree_product_keys, :digital_link_id

    add_index "spree_product_keys", ["digital_link_id"], :name => "index_product_keys_on_digital_link_id"
  end
end
