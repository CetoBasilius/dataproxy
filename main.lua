-------------------------------------------- Main
local dataproxy = require("dataproxy")

local function networkListener(event)
	local handle = event.requestId
	
	print(handle.something)
end

local handle = network.request("http://127.0.0.1/", "GET", networkListener)
dataproxy.set(handle)
handle.something = "super"