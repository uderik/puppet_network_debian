hiera.yaml
---
 - network_debian
 network-interfaces:
    eth0:
      method: manual
    br0:
      method: dhcp
      bridge_ports: eth0
      bridge_fd: 0
      bridge_maxwait: 3
