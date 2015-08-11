-- utility module

local M = {}
 
local function debounce (func)
    local last = 0
    local delay = 2000000

    return function (...)
        local now = tmr.now()
        if now - last < delay then return end

        last = now
        return func(...)
    end
end

M.debounce = debounce
 
return M