--[[
Thread | threading.new([function] Function,[table] Args)
Thread.start()

]]

local threading = {}

function threading.new(func,args)
	if type(args) ~= "table" and type(args) ~= "nil" then 
		error("Table expected, got "..type(args))
	end
	if type(func) ~= "function" then 
		error("Function expected, got ".. type(args))
	end
	local object = {}
	function object.start()
		spawn(function()
			if args then 
				func(table.unpack(args))
			else
				func()
			end
		end)
	end
	return object
end
