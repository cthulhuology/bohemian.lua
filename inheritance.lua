-- inheritance.lua
--
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	Examples of using inheritance with bohemian.lua
--

_ = require('bohemian')._

Homer = _()
	("has","age",33)
	("has","first name","Homer")
	("has","last name", "Simpson")
	("does","name", function(self)
		return self("first name") .. " " .. self("last name")
	end)
	("has","address","742 Evergreen Tr.")
	("has","occupation","Nuclear Technician")
	("does","eat", function(self,food)
		if food == "donuts" or food == "beer" then
			print("mmmmh " .. food)
		else
			print("meh!")
		end
	end)

-- Bart inherits name, address, and "last name" from Homer
Bart = _(Homer)
	("has","first name","Bart")
	("has","age",9)
	("has","occupation","student")
	("does","eat",function(self,food)
		if food == "my shorts" then
			print("eat " .. food)
		else
			print("meh!")
		end
	end)

-- Lisa inherits occupation from Bart, and name, address, and "last name" from Homer
Lisa = _(Bart,Homer)	
	("has","first name","Lisa")
	("has","age",7)
	("does","eat",function(self,food)
		print("I don't eat anything that casts a shadow")
	end)

print( Homer("name") .. " is a " .. Homer("age") .. " year old " .. Homer("occupation") ..
	" living at " .. Homer("address") )
print( Bart("name") .. " is a " .. Bart("age") .. " year old " .. Bart("occupation") ..
	" living at " .. Bart("address") )
print( Lisa("name") .. " is a " .. Lisa("age") .. " year old " .. Lisa("occupation") .. 
	" living at " .. Lisa("address") )

Homer("eat","donuts")
Homer("eat","beer")
Homer("eat","my shorts")
Bart("eat","donut")
Bart("eat","beer")
Bart("eat","my shorts")
Lisa("eat","donut")
Lisa("eat","beer")
Lisa("eat","my shorts")
