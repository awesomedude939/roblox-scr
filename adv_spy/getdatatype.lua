function getdatatype(datatype,str)
	datatype = typeof(str)
	function GetFullPathOfAnInstance(instance)
		local name = instance.Name
		local head = (#name > 0 and '.' .. name) or "['']"

		if not instance.Parent and instance ~= game then
			return head .. " --[[ PARENTED TO NIL OR DESTROYED ]]"
		end

		if instance == game then
			return "game"
		elseif instance == workspace then
			return "workspace"
		else
			local _success, result = pcall(game.GetService, game, instance.ClassName)

			if result then
				head = ':GetService("' .. instance.ClassName .. '")'
			elseif instance == client then
				head = '.LocalPlayer' 
			else
				local nonAlphaNum = name:gsub('[%w_]', '')
				local noPunct = nonAlphaNum:gsub('[%s%p]', '')

				if tonumber(name:sub(1, 1)) or (#nonAlphaNum ~= 0 and #noPunct == 0) then
					head = '["' .. name:gsub('"', '\\"'):gsub('\\', '\\\\') .. '"]'
				elseif #nonAlphaNum ~= 0 and #noPunct > 0 then
					head = '[' .. toUnicode(name) .. ']'
				end
			end
		end

		return GetFullPathOfAnInstance(instance.Parent) .. head
	end

	if datatype == "Axes" then
		local rt = "Axes.new(%s)"

		return(string.format(rt, tostring(str)))
	elseif datatype == "BrickColor" then 
		local rt = "BrickColor.new(\"%s\")"
		return(string.format(rt,tostring(str)))
	elseif datatype == "CatalogSearchParams" then 
		return("CatalogSearchParams.new("..tostring(str)..")")
	elseif datatype == "CFrame" then
		return("CFrame.new("..tostring(str)..")")
	elseif datatype == "Color3" then 
		local rt = "Color3.fromRGB(%s,%s,%s)"
		hex = str:ToHex():gsub("#","")
		r,g,b = tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
		return(string.format(rt,tostring(r),tostring(g),tostring(b)))
	elseif datatype == "ColorSequence" then 
		local rt = "ColorSequence.new{%s}"
		local rt2 = ""  
		for i,v in pairs(str.Keypoints) do 
			if i ~= #str.Keypoints then 
				rt2 = rt2..getdatatype(typeof(v),v)..", "
			else
				rt2 = rt2..getdatatype(typeof(v),v)
			end
		end
		return(string.format(rt,rt2))
	elseif datatype == "ColorSequenceKeypoint" then 
		local rt = "ColorSequenceKeypoint.new(%s)"
		local rt2 = ""
		rt2 = rt2..getdatatype(typeof(str.Time),str.Time)..", "
		rt2 = rt2..getdatatype(typeof(str.Value),str.Value)
		return(string.format(rt,rt2))
	elseif datatype == "DockWidgetPluginGuiInfo" then 
		return("DockWidgetPluginGuiInfo.new("..tostring(str)..")")
	elseif datatype == "Enums" then 
		return(tostring(str))
	elseif datatype == "Faces" then 
		return("Faces.new("..tostring(str)..")")
	elseif datatype == "FloatCurveKey" then 
		return("FloatCurveKey.new("..tostring(str)..")")
	elseif datatype == "Instance" then
		if str.Parent == nil then 
			return(string.format("Instance.new(\"%s\")",str.ClassName))
		end
		return(GetFullPathOfAnInstance(str))
	elseif datatype == "NumberRange" then
		return("NumberRange.new("..tostring(str)..")")
	elseif datatype == "NumberSequence" then
		return("NumberSequence.new("..tostring(str)..")")
	elseif datatype == "NumberSequenceKeypoint" then 
		return("NumberSequenceKeypoint.new("..tostring(str)..")")
	elseif datatype == "OverlapParams" then
		return("OverlapParams.new("..tostring(str)..")")
	elseif datatype == "PathWaypoint" then
		return("PathWaypoint.new("..tostring(str)..")")
	elseif datatype == "PhysicalProperties" then
		return("PhysicalProperties.new("..tostring(str)..")")
	elseif datatype == "Random" then
		return("Random.new("..tostring(str)..")")
	elseif datatype == "Ray" then
		return("Ray.new("..tostring(str)..")")
	elseif datatype == "RaycastParams" then
		return("RaycastParams.new("..tostring(str)..")")
	elseif datatype == "Rect" then
		return("Rect.new("..tostring(str)..")")
	elseif datatype == "Region3" then 
		return("Region3.new("..tostring(str)..")")
	elseif datatype == "Region3int16" then
		return("Region3int16.new("..tostring(str)..")")
	elseif datatype == "TweenInfo" then
		return("TweenInfo.new("..tostring(str)..")")
	elseif datatype == "UDim" then
		return("UDim.new("..tostring(str)..")")
	elseif datatype == "UDim2" then
		return("UDim2.new("..tostring(str)..")")
	elseif datatype == "Vector2" then
		return("Vector2.new("..tostring(str)..")")
	elseif datatype == "Vector2int16" then
		return("Vector2int16.new("..tostring(str)..")")
	elseif datatype == "Vector3" then
		return("Vector3.new("..tostring(str)..")")
	elseif datatype == "Vector3int16" then
		return("Vector3int16.new("..tostring(str)..")")
	elseif datatype == "string" then
		local special = {
			["\\"] = "\\\\",
			["\""] = "\\\"",
			["\0"] = "\\0",
			["\a"] = "\\a",
			["\b"] = "\\b",
			["\f"] = "\\f",
			["\n"] = "\\n",
			["\r"] = "\\r",
			["\t"] = "\\t",
			["\v"] = "\\v"
		}
		local rt = ""
		rt = str
		if string.find(str,"\\") then
			rt = string.gsub(rt,"\\", "\\\\")
		end
		for i,v in pairs(special) do 
			if string.find(str,i) then 
				rt = string.gsub(rt,i,v)
			end
		end
		return("\""..tostring(rt).."\"")
	elseif datatype == "number" or datatype == "nil" or datatype == "boolean" then
		return(tostring(str))
	elseif datatype == "table" then
		if typeof(str) == "table" then
			local r1 = false
			local rt = "{"
			for i,v in pairs(str) do 
				if v ~= str[#str] then
					rt = rt.."["..getdatatype(typeof(i),i).."] = "..getdatatype(typeof(v),v)..","
				else 
					rt = rt.."["..getdatatype(typeof(i),i).."] = "..getdatatype(typeof(v),v)
				end
			end
			print(rt)
			if string.sub(rt,#rt,#rt) == "," then 
				print(string.sub(rt,#rt,#rt))
				rt = rt:sub(0, -2)
			end
			rt = rt.."}"
			return(rt)
		elseif typeof(str) == "string" then
			return("{"..tostring(str).."}")
		end
	end
end
