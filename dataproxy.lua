-------------------------------------------- dataproxy - Add index capability to userdata - Basilio German
local dataproxy = {}
-------------------------------------------- Constants
-------------------------------------------- Caches
-------------------------------------------- Vars
-------------------------------------------- Local functions
-------------------------------------------- Module functions
function dataproxy.set(userdata)
	if type(userdata) ~= "userdata" then
		error("Expected userdata", 2)
	end
	
	local meta = getmetatable(userdata)
	local proxy = {}
	meta.__index = function(self, key)
		return proxy[key]
	end
	meta.__newindex = function(self, key, value)
		proxy[key] = value
	end
end
-------------------------------------------- Execution

return dataproxy