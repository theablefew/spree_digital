Deface::Override.new(:virtual_path => "spree/shared/_order_details",
                     :name => "add_digital_downloads_to_invoice",
                     :insert_bottom => "td[data-hook='order_item_description']",
                     :text => %q{
<% if order.state == 'complete' and item.variant.digital? %>
  <%= content_tag(:p, :class => 'download_links') do %>
    <% item.digital_links.each do |digital_link| %>
    <% if digital_link.digital.attachment.present? %>
    <% format = File.extname(digital_link.digital.attachment.path).downcase %>
      <%= link_to "Click here to download your purchase", digital_url(:host => Spree::Config.get(:site_url), :secret => digital_link.secret), :class => "btn #{format}" %>
     <% end %>
     <p>Here is the link to your webinar: <%= link_to digital_link.digital.linkable_url, digital_link.digital.linkable_url %> 
     </p>
     <p>You will be reminded of your webinar the day of the event</p>

    <% end %>
  <% end %>
<% end %>
                      },
                     :disabled => false)
