class CreateProductKeys < ActiveRecord::Migration
  def change
    create_table :spree_product_keys do |t|
      t.string :content
      t.integer :activation_count
      t.boolean :key_is_valid
      t.boolean :activated
      t.integer :downloaded
      t.integer :digital_link_id

      t.timestamps
    end
  end
end
