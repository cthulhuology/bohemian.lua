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
	local state = {}				-- internal state of object
	local parents = {...}				-- inheritance chain
	local function self(...)			-- our hero!
		local arg = table.pack(...)		-- Lua 5.1 is better here... 
		local method = table.remove(arg,1)	-- extract our method
		if type(state[method]) == "function" then
			return state[method](self,unpack(arg)) 	-- do it if we know how
		end 
		for k,v in pairs(parents) do if v("may",method) then	-- see if our parents know
				return v("lookup",method)(self,unpack(arg))
			end
		end
		return state["*"](self,method,arg)	-- if not do our default thing
	end
	state.does = function(self,method,fun)		-- binds a function as a method
		state[method] = fun			-- NB: can't see state outside
		return self
	end
	state.has = function(self,property,value)	-- composes objects to hold eachother
		state[property] = function(self)	-- we own a closure around the other!
			return value			-- return the thing we "has"
		end
		return self
	end
	state.can = function(self,method)			-- can we or our parents do it?
		if type(state[method]) == "function" then	-- we can so yes
			return true
		else
			for k,v in pairs(parents) do 		-- for each parent in order
				if v("may",method) then		-- see if they may do it!
					return true
				end 
			end
		end
		return false					-- nope, we'd default to *
	end
	state.may = function(self,method)			-- single generation can
		return type(state[method]) == "function"	-- we only check our own state
	end
	state.lookup = function(self,method)		-- returns the function in bound state
		return state[method]			-- we need this for inheritance!
	end
	state["*"] = function(self,method,args)			-- a default default handler
		print(self, " doesn't ",method, "with", args)	-- override for ignore!
		return self					 
	end
	state.is = function(self,parent)		-- declares a parent dynamically
		table.insert(parents,1,parent)		-- prepends parent to parents list
		return self
	end
	return self
end
