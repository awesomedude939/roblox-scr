function getdatatype(datatype,str,color3)
	if datatype == "Axes" then
		return("Axes.new("..tostring(str)..")")
	elseif datatype == "BrickColor" then 
		return("BrickColor.new(\""..tostring(str).."\")")
	elseif datatype == "CatalogSearchParams" then 
		return("CatalogSearchParams.new("..tostring(str)..")")
	elseif datatype == "CFrame" then
		return("CFrame.new("..str..")")
	elseif datatype == "Color3" then 
		if color3 == "rgb" then
			return("Color3.fromRGB("..tostring(str)..")")
		elseif color3 == nil or color3 ~= "rgb" then
			return("Color3.new("..tostring(str)..")")
		end
	elseif datatype == "ColorSequence" then 
		return("ColorSequence.new("..tostring(str)..")")
	elseif datatype == "ColorSequenceKeypoint" then 
		return("ColorSequenceKeypoint.new("..tostring(str)..")")
	elseif datatype == "DockWidgetPluginGuiInfo" then 
		return("DockWidgetPluginGuiInfo.new("..tostring(str)..")")
	elseif datatype == "Enums" then 
		return(tostring(str))
	elseif datatype == "Faces" then 
		return("Faces.new("..tostring(str)..")")
	elseif datatype == "FloatCurveKey" then 
		return("FloatCurveKey.new("..tostring(str)..")")
	elseif datatype == "Instance" then
		if typeof(str) == "Instance" and str.Parent == nil then
		return("Instance.new("..tostring(datatype)..")")
		elseif typeof(str) == "Instance" and str.Parent ~= nil then
		return(str:GetFullName())
		elseif typeof(str) == "string" then
		return("Instance.new("..tostring(datatype)..")")
		end
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
		local rt = ""
		rt = str
		if string.find(str,"\"") then 
			rt = string.gsub(rt,"\"","\\\"")
		end
		if string.find(str,"\n") then 
			rt = string.gsub(rt,"\n","\\n")
	        end
		if string.find(str,"\\") then
			rt = string.gsub(rt,"\\", "\\\")
		end
		return("\""..tostring(rt).."\"")
	elseif datatype == "number" or datatype == "nil" or datatype == "boolean" then
		return(tostring(str))
	elseif datatype == "table" then
		if typeof(str) == "table" then
			local r1 = false
			local rt = "{"
			for i,v in pairs(str) do
				if type(i) ~= "number" then 
					if str[#str] ~= v then
					rt = rt..i.." = "..getdatatype(typeof(v),v)..","
					r1 = true
					else
					rt = rt..i.." = "..getdatatype(typeof(v),v)
				end
				end
				
				if i ~= #str then
					rt = rt..getdatatype(typeof(v),v)..","
					else
					rt = rt..getdatatype(typeof(v),v)
				end
			end
			if r1 == true then 
				string.sub(rt,1,-2)
			end
			rt = rt.."}"
			return(rt)
		elseif typeof(str) == "string" then
			return("{"..tostring(str).."}")
		end
	end
end
