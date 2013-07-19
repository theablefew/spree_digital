class AddDigitalLinkIndexToProductKeys < ActiveRecord::Migration
  def change
    add_column :spree_product_keys, :spree_digital_link_id, :integer
  end
end
