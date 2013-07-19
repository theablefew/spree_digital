class AddProductKeyToDigitalLinks < ActiveRecord::Migration
  def up
    remove_column :spree_digital_links, :product_key
  end
  
  def down
    add_column :spree_digital_links, :product_key, :string
  end
end
