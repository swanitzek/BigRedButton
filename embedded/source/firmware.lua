local Utils = require("utils")

local gpioIndex = 3 -- Input pin (detects the press of the button)
local counter = 0 -- counts how often the button was pressed (for debug purposes)

-- callback function (handles interrupt)
function buttonPressed(level)
	print("Trigger (" .. counter .. ")")

	counter = counter + 1
	
	sendRequest(counter)

	--if level == 1 then gpio.trig(1, "down ") else gpio.trig(1, "up ") end
end

-- create a conenction to the webserver and call the /setGcmId action for testing purposes 
function sendRequest(number)
	conn=net.createConnection(net.TCP, false) 

	conn:on("receive", function(conn, payload) print(c) end )

	conn:connect(80, "xxx.xx")

	conn:on("receive", function(conn, payload)
	    print(payload)
	    end) 
	conn:on("disconnection", function(conn,payload)
	     print("disconnect")
	     conn:close()
	end)

	conn:on("connection", function(conn,payload)
	     print("sending...")
	     conn:send("GET /bigredbutton/setGcmId/?id=" .. number .. " HTTP/1.0\r\n") 
	     conn:send("Host: xxx.xx\r\n") 
	     conn:send("Accept: */*\r\n") 
	     conn:send("User-Agent: Mozilla/4.0 (compatible; ESP8266;)\r\n") 
	     conn:send("\r\n") 
	end)
end

gpio.mode(gpioIndex, gpio.INT)
gpio.trig(gpioIndex, "up", Utils.debounce(buttonPressed))

print "Running."