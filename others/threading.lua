local threading = {}

function threading.new(func,args)
	local object = {}
	function object.start()
		spawn(function()
			func(table.unpack(args))
		end)
	end
	return object
end
