module Spree
  class Digital < ActiveRecord::Base
    belongs_to :variant
    has_many :digital_links, :dependent => :destroy
  
    has_attached_file :attachment, :path => '/data/spree/shared/uploaded-files/digitals/:id/:basename.:extension'
  
    # TODO: Limit the attachment to one single file. Paperclip supports many by default :/

    attr_accessible :variant_id, :attachment, :linkable_url
      
  end
end
