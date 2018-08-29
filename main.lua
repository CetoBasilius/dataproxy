require("mobdebug").start()
-------------------------------------------- Main
local dataproxy = require("dataproxy")

local function networkListener(event)
	local handle = event.requestId
	local proxy = dataproxy.get(handle)
	
	print(proxy.something)
	
	dataproxy.remove(handle)
end

local handle1 = network.request("http://127.0.0.1/", "GET", networkListener)
local proxy1 = dataproxy.get(handle1)
proxy1.something = "super"

local handle2 = network.request("http://127.0.0.1/", "GET", networkListener)
local proxy2 = dataproxy.get(handle2)
proxy2.something = "nice"