#!/usr/bin/env lua
--
-- hello.lua
--
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	hello world for bohemian.lua
--

_ = require('bohemian')._
_()
("has","message","hello ")
("does","greet", function(self,Who) print(self("message") .. Who) end)
("greet", "world!")
