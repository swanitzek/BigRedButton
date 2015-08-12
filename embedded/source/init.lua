-- This file gets executed as soon as the controller is connected to the power supply

print "Booting..."

-- We just make a simple call to firmware.lua which contains the main program code
dofile("firmware.lua")
