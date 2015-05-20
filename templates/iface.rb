auto <%= @iface_name %>
iface <%= @iface_name %> inet <%= @iface_method %>
<% if @iface_hwaddr %>    hwaddrress ether <%= @iface_hwaddr %>
<% end -%>
<% if @iface_addr %>    address <%= @iface_addr %>
<% end -%>
<% if @iface_netmask %>    netmask <%= @iface_netmask %>
<% end -%>
<% if @iface_gateway %>    gateway <%= @iface_gateway %>
<% end -%>
<% if @iface_dns %>    dns-nameserver <%= @iface_dns %>
<% end -%>
<% if @iface_dns_search %>    dns-search <%= @iface_dns_search %>
<% end -%>

