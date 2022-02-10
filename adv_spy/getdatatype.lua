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
		return("Instance.new("..tostring(str)..")")
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
	end
end
