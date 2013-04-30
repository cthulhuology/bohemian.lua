
_ = require('bohemian')._

A = _()("does","say", function() print("hello") end)
B = _(A)("does","yell", function() print("HELLO") end)
C = _(B)("does","spell", function() print("h.e.l.l.o.") end)

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




