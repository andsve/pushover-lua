require("pushover")

local success, errstr = pushover( {
                                   token   = "", -- Your application token
                                   user    = "", -- Your user token
                                   title   = "Awesome Title",
                                   message = "Hello world!"
                                } )

if (not success) then
    print(errstr)
else
    print("Success, check your phone! :)")
end