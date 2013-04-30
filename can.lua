-- can.lua
--
-- © 2013 David J Goehrig <dave@dloh.org>
-- All Rights Reserved
--
--	An example in single level cyclic inheritence

_ = require('bohemian')._


-- create a base object A
A = _()("does","say", function() print("hello") end)

-- create an object B that derives from A
B = _(A)("does","yell", function() print("HELLO") end)

-- create an object C that derives from B
C = _(B)("does","spell", function() print("h.e.l.l.o.") end)

-- make A derive from C! (this is a ring inheritence A -> B -> C -> A)
A("is",C)

print("Can A say?", A("can","say") )
A("say")
print("Can B say?", B("can","say") )
B("say")
print("Can C say?", C("can","say") )
C("say")

print("Can A yell?", A("can","yell") )
A("yell")
print("Can B yell?", B("can","yell") )
B("yell")
print("Can C yell?", C("can","yell") )
C("yell")

print("Can A spell?", A("can","spell") )
A("spell")
print("Can B spell?", B("can","spell") )
B("spell")
print("Can C spell?", C("can","spell") )
C("spell")




