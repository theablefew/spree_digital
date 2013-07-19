class RenameProductKeysToNamespace < ActiveRecord::Migration
  def change
    rename_table :product_keys, :spree_product_keys
  end
end
