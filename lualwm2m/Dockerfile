FROM jvermillard/luadtls:latest
MAINTAINER jvermillard@gmail.com

RUN mkdir -p /build && cd /build && git clone --recursive https://github.com/sbernard31/lualwm2m.git lualwm2m && mkdir lualwm2m/build
#ADD gitmodules /build/lualwm2m/.gitmodules
#RUN cd /build/lualwm2m/ &&  git submodule update --init && cd liblwm2m && git checkout myfixes
RUN cd /build/lualwm2m/build && cmake .. && make
RUN ls -alh /build/lualwm2m/build
RUN mkdir /lwm2m && cp /build/lualwm2m/build/*.so /lwm2m/ && cp /build/luadtls/build/dtls /lwm2m/dtls -r && cp /build/lualwm2m/build/lwm2mobject.lua /lwm2m/
ADD client.lua /lwm2m/client.lua
ADD client-psk.lua /lwm2m/client-psk.lua
ENV LUA_PATH ./?/init.lua;;

# connecting to localhost by default
ENV SERVER_HOST 172.17.42.1
ENV ENDPOINT lwm2mclient

WORKDIR /lwm2m

# default script to launch
CMD ["client.lua"] 

ENTRYPOINT ["lua5.1"]
