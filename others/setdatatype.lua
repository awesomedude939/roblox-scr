function setdatatype(str : string)
	if string.match(str,"Axes.new%(") then
		local rt
		local splitted = string.split(string.gsub(str,"Axes.new%(",""),",")
		rt = Axes.new()
		local rtable = {}
		for i,v in pairs(splitted) do 
			v = string.gsub(v,"%D+", "")
			table.insert(rtable,v)
		end
		rt = Axes.new(unpack(rtable))
		return rt
	elseif string.match(str,"BrickColor.new%(") then 
		local rt
		local str = string.gsub(str,"BrickColor.new%(\"","")
		str = string.gsub(str,"\"%)","")
		rt = BrickColor.new(str)
		return rt
	elseif string.match(str,"CFrame.new%(") then 
		local rt
		local splitted = string.split(string.gsub(str,"CFrame.new%(",""),",")
		rt = CFrame.new()
		local rtable = {}
		for i,v in pairs(splitted) do 
			v = string.gsub(v,"%D+", "")
			table.insert(rtable,v)
		end
		rt = CFrame.new(unpack(rtable))
		return rt
	end
end
