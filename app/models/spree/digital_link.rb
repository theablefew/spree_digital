module Spree
  class DigitalLink < ActiveRecord::Base
    
    belongs_to :digital
    belongs_to :line_item
    
    validates_length_of :secret, :is => 30
    validates :digital, :presence => true
    
    before_validation :set_defaults, :on => :create
    
    # Can this link stil be used? It is valid if it's less than 24 hours old and was not accessed more than 3 times
    def authorizable?
      self.created_at > Spree::DigitalConfiguration[:authorized_days].day.ago and self.access_counter < Spree::DigitalConfiguration[:authorized_clicks]
    end
    
    # This method should be called when a download is initiated.
    # It returns +true+ or +false+ depending on whether the authorization is granted.
    def authorize!
      authorizable? && increment!(:access_counter) ? true : false
    end
    
    private
    
    # Populating the secret automatically and zero'ing the access_counter (otherwise it might turn out to be NULL)
    def set_defaults
      self.secret = SecureRandom.hex(15)
      self.access_counter = 0
      
      p = Spree::ProductKey.new( 
          :content => SecureRandom.uuid.upcase, 
          :key_is_valid => true, 
          :activation_count => 0,
          :activated => false,
          :downloaded => false,
          :product_id => self.line_item.variant.product_id,
          :variant_id => self.line_item.variant.id,
          :order_id => self.line_item.order.id,
          :user_id => self.line_item.order.user_id,
          :sku => self.line_item.variant.sku,
          :spree_digital_link_id => self.id
      )
      p.save!
    end

    attr_accessible :digital, :line_item, :secret

  end
end