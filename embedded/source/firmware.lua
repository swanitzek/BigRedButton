local gpioIndex = 3 -- Input pin (detects the press of the button)
local counter = 0 -- counts how often the button was pressed (for debug purposes)

-- debounce function
function debounce (func)
    local last = 0
    local delay = 2000000

    return function (...)
        local now = tmr.now()
        if now - last < delay then return end

        last = now
        return func(...)
    end
end

-- callback function (handles interrupt)
function buttonPressed(level)
	print("Trigger (" .. counter .. ")")

	counter = counter + 1
	--if level == 1 then gpio.trig(1, "down ") else gpio.trig(1, "up ") end
end

print "Starting..."

gpio.mode(gpioIndex, gpio.INT)
gpio.trig(gpioIndex, "up", debounce(buttonPressed))

print "Running."