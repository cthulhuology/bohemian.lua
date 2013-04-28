
_ = require('bohemian')._
o = _()
("has","Bob",_()
	("has", "greeting", "Hi ")
	("has", "friend", _()
		("has","name","Mary")
		("does","greet", function(self,Who) 
				print("Hola " .. Who .. "!")
				return self
			end))
	("does", "greet", function(self,Who) 
			print(self("greeting") .. Who .. "!")
			return self 
		end))

o("Bob")
	("greet", o("Bob")("friend")("name") )
	("friend")("greet","Bob")


