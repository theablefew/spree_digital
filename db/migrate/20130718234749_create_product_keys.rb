class CreateProductKeys < ActiveRecord::Migration
  def change
    create_table :product_keys do |t|
      t.string :content
      t.integer :activation_count
      t.boolean :key_is_valid
      t.boolean :activated
      t.integer :downloaded
      t.integer :product_id
      t.integer :variant_id
      t.integer :order_id
      t.integer :user_id
      t.string :sku

      t.timestamps
    end
  end
end
