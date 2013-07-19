class AddDigitalLinkIndexToProductKeys < ActiveRecord::Migration
  def change
    add_column :spree_product_keys, :spree_digital_link_id, :integer
    add_index "spree_product_keys", ["spree_digital_link_id"], :name => "index_product_keys_on_spree_digital_link_id"
  end
end
