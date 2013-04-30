-- deposit.lua
--
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	An example application with behavioralism

_ = require('bohemian')._

-- we can use this as a prototype
Person = function() 
	return _()
		("has", "wallet", 10)	-- dollars in wallet
		("does", "dollars", function(self)
			print(self("name") .. " has $" .. self("wallet") .. ".")
			return self
		end)
		("does", "take", function(self,dollars)
			self("has", "wallet", self("wallet") + dollars)
			return self
		end)
		("does", "give", function(self,person,dollars)
			if dollars < self("wallet") and dollars > 0 then
				self("has","wallet", self("wallet") - dollars)
				person("take",dollars)
			else
				print(self("name") .. " doesn't have $" .. dollars)
			end
			return self
		end)
end

Bob = Person()("has","name","Bob")
Alice = Person()("has","name","Alice")

-- Bob gives Alice 4
Bob("give",Alice, 4)
Bob("dollars")
Alice("dollars")

-- Bob can't give Alice 10 as he only has 6 left
Bob("give",Alice, 10)

-- Alice gives Bob 10 back
Alice("give",Bob, 10)
Bob("dollars")
Alice("dollars")

