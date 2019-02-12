# CLI example

This example demonstrate a minimal application that exposes the network
configuration and management interfaces via a basic command-line interface. The
steps below take you through the minimal steps required to ping one emulated
Thread device from another emulated Thread device.

## 1. Start node 1

```bash
$ ./micropython main_1.py
```

Set the PAN ID:

```bash
> panid 0x1234
Done
```

Bring up the IPv6 interface:

```bash
> ifconfig up
Done
```

Start Thread protocol operation:

```bash
> thread start
Done
```

Wait a few seconds and verify that the device has become a Thread Leader:

```bash
> state
leader
Done
```

View IPv6 addresses assigned to Node 1's Thread interface:

```bash
> ipaddr
fdde:ad00:beef:0:0:ff:fe00:fc00
fdde:ad00:beef:0:0:ff:fe00:dc00
fdde:ad00:beef:0:8ce2:b347:1711:9854
fe80:0:0:0:2882:c8d8:fe43:4d98
Done
```

## 2. Start node 2

```bash
$ ./micropython main_2.py
```

Set the PAN ID:

```bash
> panid 0x1234
Done
```

Bring up the IPv6 interface:

```bash
> ifconfig up
Done
```

Start Thread protocol operation:

```bash
> thread start
Done
```

Wait a few seconds and verify that the device has become a Thread Child/Router:

```bash
> state
child
Done
```

View IPv6 addresses assigned to Node 2's Thread interface:

```bash
> ipaddr
fdde:ad00:beef:0:0:ff:fe00:dc01
fdde:ad00:beef:0:3f62:62d3:8fb6:c1cb
fe80:0:0:0:70af:c6bf:dabb:c58d
Done
```

### 3. Ping node 1 from node 2

ping (ipaddr) (length) (count) (interval: in seconds) 

default parameter: length = 8, count = 1, interval = 1 (seconds)

```bash
> ping fdde:ad00:beef:0:8ce2:b347:1711:9854
16 bytes from fdde:ad00:beef:0:8ce2:b347:1711:9854: icmp_seq=1 hlim=64 time=12ms
```
