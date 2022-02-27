local threading = {}

function threading.new(func,args)
	if type(args) ~= "table" then 
		error("Table expected, got "..type(args))
	end
	if type(func) ~= "function" then 
		error("Function expected, got ".. type(args))
	end
	local object = {}
	function object.start()
		spawn(function()
			func(table.unpack(args))
		end)
	end
	return object
end
