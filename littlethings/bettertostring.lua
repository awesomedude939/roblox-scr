local getDATAtypexdtc_ycletabl_exdtgetDATAtype = {}
function btostring(val, second_arg)
	local classname = typeof(val)

	if classname == "Axes" then 
		return string.format("Axes.new(%s,%s,%s,%s,%s,%s,%s,%s,%s)", btostring(val.X), btostring(val.Y), btostring(val.Z), btostring(val.Top), btostring(val.Bottom), btostring(val.Left), btostring(val.Right), btostring(val.Back), btostring(val.Front))
	elseif classname == "BrickColor" then
		return string.format("BrickColor.new(\"%s\")", val.Name)
	elseif classname == "CFrame" then
		if second_arg == "cframeb" then 
			return string.format("CFrame.new(%s)", btostring(val))
		else 
			return string.format("CFrame.new(%s,%s,%s)", btostring(val.X), btostring(val.Y), btostring(val.Z))
		end
	elseif classname == "Color3" then 
		return string.format("Color3.fromRGB(%s,%s,%s)", math.round(val.R*255), math.round(val.G*255), math.round(val.B*255))
	elseif classname == "ColorSequence" then 
		return string.format("ColorSequence.new(%s)", btostring(val.Keypoints))
	elseif classname == "ColorSequenceKeypoint" then 
		return string.format("ColorSequenceKeypoint", btostring(val.Time), btostring(val.Value))
	elseif classname == "DockWidgetPluginGuiInfo" then
		return string.format("DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right,%s,%s,%s,%s,%s,%s)", val.InitialEnabled, val.InitialEnabledShouldOverrideRestore, val.FloatingXSize, val.FloatingYSize, val.MinWidth, val.MinHeight)
	elseif classname == "EnumItem" then
		return tostring(val)
	elseif classname == "Faces" then 
		return string.format("Faces.new(%s)", btostring(val))
	elseif classname == "FloatCurveKey" then 
		return string.format("FloatCurveKey.new(%s,%s,%s)", btostring(val.Time), btostring(val.Value), btostring(val.Interpolation))
	elseif classname == "Instance" then 
		if val.Parent ~= nil and val ~= game then
			if getFullNameOfInstance then 
				return getFullNameOfInstance(val)
			else 
				getFullNameOfInstance = function(ins)
					if ins == game then 
						return "game"
					elseif ins == nil then 
						return "nil"
					end

					local name = ins.Name
					local head

					if not ins.Parent and ins ~= game then 
						return "nil"
					end

					if #name < 1 then 
						head = "[\"\"]"
					elseif string.match(name, "^[0-9]") then 
						head = string.format("[\"%s\"]", name)
					end
					if string.find(string.lower(name),"[^A-Za-z0-9]+") then 
						head = string.format("[\"%s\"]", name)
					end
					if head then
						return getFullNameOfInstance(ins.Parent)..head
					else
						return getFullNameOfInstance(ins.Parent).."."..name
					end
				end

				return getFullNameOfInstance(val)
			end
		else 
			if getnilinstances then 
				for i,v in pairs(getnilinstances()) do 
					if v == val then 
						return string.format("getnilinstances()[%s]", i)
					end
				end
			else
				return string.format("Instance.new(\"%s\")", val.ClassName)
			end
		end
	elseif classname == "NumberRange" then
		return string.format("NumberRange.new(%s,%s)", val.Min, val.Max)
	elseif classname == "NumberSequence" then
		return string.format("NumberSequence.new(%s)", btostring(val.Keypoints))
	elseif classname == "NumberSequenceKeypoint" then 
		return string.format("NumberSequenceKeypoint.new(%s,%s,%s)", val.Time, val.Value, val.Envelope)
	elseif classname == "PathWaypoint" then 
		return string.format("PathWaypoint.new(%s,%s,%s)", btostring(val.Position), btostring(val.Action), btostring(val.Label))
	elseif classname == "PhysicalProperties" then 
		return string.format("PhysicalProperties.new(%s,%s,%s,%s,%s)", val.Density, val.Friction, val.Elasticity, val.FrictionWeight, val.ElasticityWeight)
	elseif classname == "Ray" then 
		return string.format("Ray.new(%s, %s)", val.Origin, val.Direction)
	elseif classname == "Rect" then 
		return string.format("Rect.new(%s,%s)", btostring(val.Min), btostring(val.Max))
	elseif classname == "Region3int16" then 
		return string.format("Region3int16.new(%s,%s)", btostring(val.Min), btostring(val.Max))
	elseif classname == "TweenInfo" then 
		return string.format("TweenInfo.new(%s,%s,%s,%s,%s,%s)", tostring(val.Time), btostring(val.EasingStyle), btostring(val.EasingDirection), tostring(val.RepeatCount), tostring(val.Reverses), tostring(val.DelayTime))
	elseif classname == "UDim" then
		return string.format("UDim.new(%s,%s)", tostring(val.Scale), tostring(val.Offset))
	elseif classname == "UDim2" then
		return string.format("UDim2.new(%s,%s)", btostring(val.X), btostring(val.Y))
	elseif classname == "Vector2" then 
		return string.format("Vector2.new(%s,%s)", val.X, val.Y)
	elseif classname == "Vector2int16" then
		return string.format("Vector2int16.new(%s,%s)", val.X, val.Y)
	elseif classname == "Vector3" then 
		return string.format("Vector3.new(%s,%s,%s)", val.X, val.Y, val.Z)
	elseif classname == "Vector3int16" then 
		return string.format("Vector3int16.new(%s,%s,%s)", val.X, val.Y, val.Z)
	elseif classname == "boolean" or classname == "bool" then 
		return tostring(val)
	elseif classname == "number" then 
		return tostring(val)
	elseif classname == "nil" then
		return "nil"
	elseif classname == "string" then
		local rval = val
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
		
		for i,v in pairs(special) do 
			if string.match(val, i) then 
				rval = string.gsub(val,i,v)
			end
		end
		return string.format("\"%s\"", rval)
	elseif classname == "function" then 
		local functionlist = {
			-- luau
			["delay"] = delay,
			["printidentity"] = printidentity,
			["require"] = require,
			["settings"] = settings,
			["spawn"] = spawn,
			["stats"] = stats,
			["tick"] = tick,
			["time"] = time,
			["typeof"] = typeof,
			["UserSettings"] = UserSettings,
			["version"] = version,
			["wait"] = wait,
			["warn"] = warn,
			-- lua
			["assert"] = assert,
			["collectgarbage"] = collectgarbage,
			["error"] = error,
			["getfenv"] = getfenv,
			["getmetatable"] = getmetatable,
			["ipairs"] = ipairs,
			["loadstring"] = loadstring,
			["newproxy"] = newproxy,
			["next"] = next,
			["pairs"] = pairs,
			["pcall"] = pcall,
			["print"] = print,
			["rawequal"] = rawequal,
			["rawget"] = rawget,
			["rawset"] = rawset,
			["select"] = select,
			["setfenv"] = setfenv,
			["setmetatable"] = setmetatable,
			["tonumber"] = tonumber,
			["tostring"] = tostring,
			["type"] = type,
			["unpack"] = unpack,
			["xpcall"] = xpcall,
			-- other
			["btostring"] = btostring
		}
		
		for i,v in pairs(functionlist) do
			if val == v then 
				return i
			end
		end
		return "unkfunc"
	elseif classname == "table" then
		if not table.find(getDATAtypexdtc_ycletabl_exdtgetDATAtype, val) then 
		table.insert(getDATAtypexdtc_ycletabl_exdtgetDATAtype, val)
		local finishedstring = "{"
		if val == _G then return "_G" end
		local lastval
		for i,v in pairs(val) do
		    lastval = i
		end
		for i,v in pairs(val) do
		    if typeof(i) == "string" then 
    		    finishedstring ..= string.format("[\"%s\"] = ", btostring(i))
    		else 
    		    finishedstring ..= string.format("[%s] = ", btostring(i))
			end
			finishedstring ..= btostring(v, val)
			if i ~= lastval then 
			    finishedstring ..= ", "
			end
		end
		
		finishedstring ..= "}"
		return finishedstring
		else 
			return "{\"*** cycle table reference detected ***\"}"
		end
		return "{}"
	end
	return tostring(val)
end
