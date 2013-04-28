#!/usr/bin/env lua
--
-- pinky_and_the_brain.lua
--
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	a demo of using bohemain.lua with multiple objects
--

_ = require('bohemian')._

local catchphrase = function(self) print(self("name") .. " > " .. self("catchphrase")) end

_()
("has","Brain",_()
	("does","say",catchphrase)
	("has","name","Brain")
	("has","catchphrase","Are you thinking what I'm thinking?"))
("has","Pinky",_()
	("has","name","Pinky")
	("does","say",catchphrase)
	("has","catchphrase","NARF!!!"))
("does","skit", function(self)
		self("Brain")("say")	
		self("Pinky")("say")
	end)
("skit")

