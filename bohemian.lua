-- bohemian.lua
-- 
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	Bohemian for Lua function objects with private state.
--
-- for luajit2.0 requires CFLAGS=-DLUAJIT_ENABLE_LUA52COMPAT make
--

module("bohemian",package.seeall)

_ = function()
    local state = {}
    local function self(...)
	local arg = table.pack(...)	
        local method = table.remove(arg,1)
        return state[method](self,unpack(arg))
    end
    state.does = function(self,method,fun)
        state[method] = fun
        return self
    end
    state.has = function(self,property,value)
        state[property] = function(self)
            return value
        end
        return self
    end
    return self
end
