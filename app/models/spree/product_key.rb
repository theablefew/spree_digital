module Spree
  class ProductKey < ActiveRecord::Base
  
    belongs_to :digital_link
    
    validates :digital, :presence => true
    
    before_validation :set_defaults, :on => :create
    
    def invalidate_key
      self.key_is_valid = false
    end

    def activate
      
    end
    
    def ban
      
    end
    
    def reset_activation_count
      
    end
    
    
    private
    
    # Populating the secret automatically and zero'ing the access_counter (otherwise it might turn out to be NULL)
    def set_defaults
      self.secret = SecureRandom.hex(15)
      self.access_counter = 0
      self.product_key = SecureRandom.uuid.upcase#.insert(8, self.id.to_s)
    end

    attr_accessible :activated, :activation_count, :content, :downloaded, :order_id, :product_id, :sku, :user_id, :key_is_valid, :variant_id
    
  end
end