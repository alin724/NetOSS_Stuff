# Docker container example

## Create the container network 
bridge network - container interconnect and isolation

### Command

```sh
sudo docker network create -d bridge example-bridge-network
```

## Create the container

```sh
sudo docker container create -i -t --name example-container alpine
```

## Connect the container to the network

```sh
docker run -itd --network=example-bridge-network example-container
```

## Run container in the network

```sh
sudo docker run -itd --name example-contaienr --network=example-bridge-network -d alpine
```

## Exec commands inside the container

```sh
sudo docker exec -it example-container /bin/sh
/ # ifconfig
eth0      Link encap:Ethernet  HWaddr A6:F8:6B:F8:98:99
          inet addr:172.18.0.2  Bcast:172.18.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:17 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:1462 (1.4 KiB)  TX bytes:126 (126.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

/ #
```

## Inspect the example bridge container network

```sh
sudo docker network inspect example-bridge-network
[
    {
        "Name": "example-bridge-network",
        "Id": "508acf10f738dbee11b815cfbd159bcd8069057b1006a49c5dda395cfd6303ab",
        "Created": "2025-05-07T22:17:39.904815324+03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "a410975db4c2e7c9285552af273b81a0c27ce49acf8f35cdf5d0c1e281929db8": {
                "Name": "example-contaienr",
                "EndpointID": "15e5d2b8db7fb0b9e2a9000a9dfc505cbe92e709130b0d7676b34b1aef31bc85",
                "MacAddress": "a6:f8:6b:f8:98:99",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```
