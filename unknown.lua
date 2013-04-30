
_ = require('bohemian')._

Oracle = _()("has","name","Oracle")

print("Oracle predicting the future")
Oracle("predict","future")

print("Oracle unknown handle overriding")
Oracle("does","unknown", function(self,method,args)
	print(self("name") .. " doesn't know how to " .. method .. "(" .. unpack(args) .. ")")
end)
Oracle("predict","future")

print("Oracle learning how to predict")
Oracle("does","predict", function(self,time)
	if time == "future" then
		print("future is hazy, but it will come tomorrow...")
	elseif time == "past" then
		print("the past is easy to predict")
	elseif time == "present" then
		print("You wish")
	else
		print("I could never predict that!")
	end
end)

Oracle("predict","past")
Oracle("predict","present")
Oracle("predict","future")


