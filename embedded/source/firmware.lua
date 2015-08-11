local Utils = require("utils")

local gpioIndex = 3 -- Input pin (detects the press of the button)
local counter = 0 -- counts how often the button was pressed (for debug purposes)

-- callback function (handles interrupt)
function buttonPressed(level)
	print("Trigger (" .. counter .. ")")

	counter = counter + 1
	--if level == 1 then gpio.trig(1, "down ") else gpio.trig(1, "up ") end
end

gpio.mode(gpioIndex, gpio.INT)
gpio.trig(gpioIndex, "up", Utils.debounce(buttonPressed))

print "Running."