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

_ = function(...)
	local state = {}
	local parents = {...}
	local function self(...)
		local arg = table.pack(...)	
		local method = table.remove(arg,1)
		if type(state[method]) == "function" then
			return state[method](self,unpack(arg)) 
		end 
		for k,v in pairs(parents) do if v("can",method) then
				return v("lookup",method)(self,unpack(arg))
			end
		end
		return state["unknown"](self,method,arg)
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
	state.can = function(self,method)
		return type(state[method]) == "function"
	end
	state.lookup = function(self,method)
		return state[method]
	end
	state.unknown = function(self,method,args)
		print(self, " doesn't ",method, "with", args)
		return self	
	end
	return self
end
