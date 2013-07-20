module Spree
  class ProductKeysController < ApplicationController
  
    def verify_key
      @hash = OpenStruct.new
      if key_validation(params[:product_key])
        @hash.response = 'Successfully Activated Product Key'
        render "spree/api/product_keys/valid_key", :status => 200 and return
      else
        @hash.response = 'Product Key Not Valid For Additional Activations'
        render "spree/api/product_keys/invalid_key", :status => 402 and return
      end
    end
  
  
    private
  
    def key_validation(key)
      @key = ProductKey.where(:content => key).first
      if @key && @key.activation_count < 5
        @key.activation_count += 1
        @key.activated = true
        @key.save!
        
        link = @key.digital_link
        line = link.line_item
        order = line.order
        order.shipment_state = "shipped"
        order.save!
        return true
      else
        return false
      end
    end
  end
end