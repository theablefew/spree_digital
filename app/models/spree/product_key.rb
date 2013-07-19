module Spree
  class ProductKey < ActiveRecord::Base  
    belongs_to :digital_link
    validates :digital, :presence => true    
    attr_accessible :content, :key_is_valid, :activation_count, :activated, :downloaded, :product_id, :variant_id, :order_id, :user_id, :sku, :spree_digital_link_id
    
    def invalidate_key
      self.key_is_valid = false
    end

    def activate
      
    end
    
    def ban
      
    end
    
    def reset_activation_count
      
    end
        
  end
end