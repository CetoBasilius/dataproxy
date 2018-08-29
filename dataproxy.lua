-------------------------------------------- dataproxy - Add index capability to userdata - Basilio German
local dataproxy = {}
-------------------------------------------- Constants
-------------------------------------------- Caches
-------------------------------------------- Vars
local proxyList
local initialized
-------------------------------------------- Local functions
local function initialize()
	if not initialized then
		initialized = true
		
		proxyList = {}
	end
end

local function findProxy(userdata)
	local foundProxy = proxyList[userdata] -- Quick search
	if not foundProxy then -- Search through iteration
		for key, proxy in pairs(proxyList) do
			if key == userdata then
				foundProxy = proxy
				
				break
			end
		end
	end
	
	return foundProxy
end

local function removeProxy(userdata)
	local foundProxy = proxyList[userdata] -- Quick search
	if not foundProxy then -- Search through iteration
		for key, proxy in pairs(proxyList) do
			if key == userdata then
				proxyList[key] = nil
				
				return true
			end
		end
	else
		proxyList[userdata] = nil
		
		return true
	end
	
	return false
end
-------------------------------------------- Module functions
function dataproxy.get(userdata)
	if type(userdata) ~= "userdata" then
		error("Expected userdata", 2)
	end
	
	local proxy = findProxy(userdata)
	if not proxy then -- No proxy, create new and index
		proxy = {}
		proxyList[userdata] = proxy
	end
	
	return proxy
end

function dataproxy.remove(userdata)
	if type(userdata) ~= "userdata" then
		error("Expected userdata", 2)
	end
	
	return removeProxy(userdata)
end
-------------------------------------------- Execution
initialize()

return dataproxy