---
layout: post
title:  "Two Dockerized Rails Apps, Two Dockerized Postgres DBs, One Docker Network"
date:   "Sat Jan 20 04:26:55 PM EST 2024"
tags: [docker,devops,rails,postgres,portfolio]
---
To those who understand, this means a lot...

```bash
$ docker network inspect factorius-network
[
    {
        "Name": "factorius-network",
        "Id": "d4d09258df84ab4985fb9141e6d7371f4c2ec91bef387cb46f8828a8b370ab49",
        "Created": "2024-01-20T19:23:01.988886329+02:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.25.0.0/16",
                    "Gateway": "172.25.0.1"
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
            "34cc913039435e0fae3d06f04458c97b0b6b7181a8a936415ed60f586f2d2706": {
                "Name": "factorius-client-web",
                "EndpointID": "f8eac2415de6343003bf436a1d1720e64e00a292c3875d09208cab38ccd8556d",
                "MacAddress": "02:42:ac:19:00:03",
                "IPv4Address": "172.25.0.3/16",
                "IPv6Address": ""
            },
            "7145c62238ae93468692ce47e55b72d86add00f007d35f4a1d8d5e1f127d7a88": {
                "Name": "factorius-order-manager-postgres",
                "EndpointID": "bd6c669cbe445daed7c20782f3ee516ee68f5f7ec9720c5c04d007d87dbbb87c",
                "MacAddress": "02:42:ac:19:00:04",
                "IPv4Address": "172.25.0.4/16",
                "IPv6Address": ""
            },
            "a6be27b33f31253bfb258d7aeeda93363486452924ccebd8c029f9009cc009ac": {
                "Name": "factorius-order-manager-web",
                "EndpointID": "00aa6a7f7903d0295627149fe393c6656552de3c69a143c9576af4245b86f4a5",
                "MacAddress": "02:42:ac:19:00:05",
                "IPv4Address": "172.25.0.5/16",
                "IPv6Address": ""
            },
            "e2fbc067b32b614b441db1aaeaf509fb0fd7e37d1ae8ac8531c3ebdeb171db4b": {
                "Name": "factorius-client-postgres",
                "EndpointID": "f48d96d9d1d8b170c1becbabe7bcefd3282ccbf27e02b7acd3547b51b9e9a705",
                "MacAddress": "02:42:ac:19:00:02",
                "IPv4Address": "172.25.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```
