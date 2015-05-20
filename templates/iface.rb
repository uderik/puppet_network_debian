auto <%= @iface_name %>
iface <%= @iface_name %> inet <%= @iface_method %>
<% if @iface_br_ports %>\tbridge_ports <%= @iface_br_ports %>
<% end -%>
<% if @iface_br_fd %>\tbridge_fd <%= @iface_br_fd %>
<% end -%>
<% if @iface_br_maxwait %>\tbridge_maxwait <%= @iface_br_maxwait %>
<% end -%>
<% if @iface_hwaddr %>\thwaddrress ether <%= @iface_hwaddr %>
<% end -%>
<% if @iface_addr %>\taddress <%= @iface_addr %>
<% end -%>
<% if @iface_netmask %>\tnetmask <%= @iface_netmask %>
<% end -%>
<% if @iface_gateway %>\tgateway <%= @iface_gateway %>
<% end -%>
<% if @iface_dns %>\tdns-nameserver <%= @iface_dns %>
<% end -%>
<% if @iface_dns_search %>\tdns-search <%= @iface_dns_search %>
<% end -%>

