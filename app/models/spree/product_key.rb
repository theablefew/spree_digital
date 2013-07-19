module Spree
  class ProductKey < ActiveRecord::Base  
    belongs_to :digital_link
    attr_accessible :content, :key_is_valid, :activation_count, :activated, :downloaded, :digital_link
    
    validates_length_of :content, :is => 36
    validates :digital_link, :presence => true
    
    before_validation :set_defaults, :on => :create
        
    private
    
    def set_defaults
      self.content = SecureRandom.uuid.upcase
      self.key_is_valid = true
      self.activation_count = 0
      self.activated = false
      self.downloaded = 0
    end
  end
end