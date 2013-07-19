class RenameSpreeDigitalLinkId < ActiveRecord::Migration
  def change
    rename_column :spree_product_keys, :spree_digital_link_id, :digital_link_id
  end
end
