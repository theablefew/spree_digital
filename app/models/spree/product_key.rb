module Spree
  class ProductKey < ActiveRecord::Base
    attr_accessible :activated, :activation_count, :content, :downloaded, :order_id, :product_id, :sku, :user_id, :key_is_valid, :variant_id
  
    def invalidate_key
      self.key_is_valid = false
    end
  end
end