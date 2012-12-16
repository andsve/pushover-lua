-- Dependencies: LuaSocket and luasec ( https://github.com/brunoos/luasec/ )
require("https")

-- Usage: successbool, errstring = pushover( { a table with keys and values corresponding to pushover API } )
function pushover( request )
	local pushover_url = "https://api.pushover.net/1/messages.json"

	-- create POST data string
	local data_str = {}
	for k,v in pairs(request) do
		table.insert(data_str, tostring(k) .. "=" .. tostring(v))
	end
	data_str = table.concat(data_str, "&")
	
	-- send request
	local res, code, headers, status = ssl.https.request(pushover_url, data_str)

	-- check for errors
	if (code ~= 200) then
		local errstr = "Error while sending request. Status code: " .. tostring(code) .. ", Body: " .. tostring(res)
		return false, errstr
	elseif (res ~= '{"status":1}') then
		local errstr = "Error from pushover: " .. tostring(res)
		return false, errstr
	end

	return true

end

