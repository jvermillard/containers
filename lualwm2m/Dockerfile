FROM luadtls:latest
MAINTAINER jvermillard@gmail.com
RUN mkdir -p /build && cd /build && git clone https://github.com/sbernard31/lualwm2m.git lualwm2m && mkdir lualwm2m/build
ADD gitmodules /build/lualwm2m/.gitmodules
RUN cd /build/lualwm2m/ &&  git submodule update --init && cd liblwm2m && git checkout myfixes
RUN cd /build/lualwm2m/build && cmake .. && make
RUN ls -alh /build/lualwm2m/build
RUN mkdir /lwm2m && cp /build/lualwm2m/build/*.so /lwm2m/ && cp /build/luadtls/build/dtls /lwm2m/dtls -r
ADD client.lua /lwm2m/client.lua
#ENTRYPOINT cd /lwm2m && lua5.1 ./client.lua
