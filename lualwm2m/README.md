A container for the lua binding of wakaama with DTLS

http://github.com/sbernard31/lualwm2m

https://github.com/eclipse/wakaama

-----
Available from Docker Hub Registry: https://registry.hub.docker.com/u/jvermillard/lualwm2m/

Usage
-----

* Run a client (no security)
```
sudo docker run -t --rm --name=lwm2mclient jvermillard/lualwm2m
```

* Run a client using PSK security mode:
```
sudo docker run -t --rm --name=lwm2mclient jvermillard/lualwm2m client-psk.lua <identity> <psk>
```

* Run your own client script:
```
sudo docker run -t --rm --name=lwm2mclient -v <your_script.lua>:/lwm2m/client.lua jvermillard/lualwm2m client.lua <param1> <param2>
```

By default, the client tries to register to a local server and its endpoint identifier is 'lwm2mclient'.
These values can be specified with the environment variables SERVER_HOST and ENDPOINT.
```
sudo docker run -t --rm --name=lwm2mclient -e SERVER_HOST=<you_server> -e ENDPOINT=<your_endpoint> ...
```

