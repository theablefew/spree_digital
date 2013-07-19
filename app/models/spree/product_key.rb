module Spree
  class ProductKey < ActiveRecord::Base  
    belongs_to :digital_link
    belongs_to :variant
    belongs_to :line_item
    attr_accessible :content, :key_is_valid, :activation_count, :activated, :downloaded, :variant, :line_item, :digital_link
    
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
      self.content = SecureRandom.uuid.upcase
      self.key_is_valid = true
      self.activation_count = 0
      self.activated = false
      self.downloaded = 0
    end
        
  end
end