pushover-lua
============

Simple Pushover (https://pushover.net) API wrapper/snippet in Lua.

Usage
=====
```lua
require("pushover")

-- setup the three required fields of the request table:
local request = { token   = "APP_TOKEN",   -- your application's API token
                  user    = "USER_KEY",    -- the user key of your user, viewable when logged into the dashboard
                  message = "Hello World!" -- your message
                }

-- Some optional parameters may be included: device, title, url, url_title, priority, timestamp, sound
-- Read more about the parameters on: https://pushover.net/api

-- send the request, don't forget to check the return values
local success, err = pushover( request )

if (success) then
  print("Yay the push was sent!")
else
  print("Nay, the push failed with error: " .. err)
end
```
   
`success` will be `true` on a successfull pushover response, and `false` in case of an error. (`err` will also be set in this case.)

Dependencies
============
* LuaSocket - http://w3.impa.br/~diego/software/luasocket/
* luasec - https://github.com/brunoos/luasec/

License
=======
Public domain, use anyway you want.

