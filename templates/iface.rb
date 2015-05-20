auto <%= @iface_name %>
iface <%= @iface_name %> inet <%= @iface_method %>
<% if !@iface_br_ports.empty? %>    bridge_ports <%= @iface_br_ports %>
<% end -%>
<% if !@iface_br_fd.empty? %>     bridge_fd <%= @iface_br_fd %>
<% end -%>
<% if !@iface_br_maxwait.empty? %>    bridge_maxwait <%= @iface_br_maxwait %>
<% end -%>
<% if !@iface_hwaddr.empty? %>    hwaddrress ether <%= @iface_hwaddr %>
<% end -%>
<% if !@iface_addr.empty? %>    address <%= @iface_addr %>
<% end -%>
<% if !@iface_netmask.empty? %>    netmask <%= @iface_netmask %>
<% end -%>
<% if !@iface_gateway.empty? %>    gateway <%= @iface_gateway %>
<% end -%>
<% if !@iface_dns.empty? %>    dns-nameserver <%= @iface_dns %>
<% end -%>
<% if !@iface_dns_search.empty? %>    dns-search <%= @iface_dns_search %>
<% end -%>

