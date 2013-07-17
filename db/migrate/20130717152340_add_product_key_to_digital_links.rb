class AddProductKeyToDigitalLinks < ActiveRecord::Migration
  def change
    add_column :spree_digital_links, :product_key, :string
  end
end
