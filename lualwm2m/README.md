A container for the lua binding of wakaama with DTLS

http://github.com/sbernard31/lualwm2m

https://github.com/eclipse/wakaama

Usage
-----
Run a client using PSK security mode:
```
docker run -t --rm --name=lwm2mclient lualwm2m <endpoint> <server_host> <identity> <psk>
```

