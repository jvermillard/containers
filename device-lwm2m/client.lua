local lwm2m = require 'lwm2m'
local socket = require 'socket'
-- local dtls = require 'dtls'

local udp = socket.udp();
-- let the system choose an ephemeral port
-- udp:setsockname('*', 5682)

-- change UDP socket in DTLS socket
-- dtls.wrap(udp, {security = "PSK", identity = arg[3], key = arg[4]})

local sn = os.getenv("DEVICE_SN")

local server = os.getenv("DEVICE_SERVER")

local deviceObj = {
  id = 3,
  [0]  = "Open Mobile Alliance",                                       -- manufacturer
  [1]  = "Lightweight M2M Client",                                     -- model number
  [2]  = sn,                                                  -- serial number
  [3]  = "1.0",                                                        -- firmware version
  [4]  = {execute = function (obj) print ("Reboot!") end},             -- reboot
  [5]  = {execute = function (obj) print ("Factory reset!") end},      -- factory reset
  [13] = {read = function() return os.time() end},                     -- current time
}
print("endpoint: " .. sn .. " - server host: " .. server);

local ll = lwm2m.init(sn, {deviceObj},
  function(data,host,port) udp:sendto(data,host,port) end)

ll:addserver(123, server, 5683)
ll:register()

repeat
  ll:step()
  local data, ip, port, msg = udp:receivefrom()
  if data then
    ll:handle(data,ip,port)
  end
until false

