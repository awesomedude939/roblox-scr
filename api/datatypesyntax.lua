function getdatatype(datatype,str,color3)
	if datatype == "Axes" then
		return("Axes.new("..str..")")
	elseif datatype == "BrickColor" then 
		return("BrickColor.new(\""..str.."\")")
	elseif datatype == "CatalogSearchParams" then 
		return("CatalogSearchParams.new("..str..")")
	elseif datatype == "CFrame" then
		return("CFrame.new("..str..")")
	elseif datatype == "Color3" then 
		if color3 == "rgb" then
			return("Color3.fromRGB("..str..")")
		else
			return("Color3.new("..str..")")
		end
	elseif datatype == "ColorSequence" then 
		return("ColorSequence.new("..str..")")
	elseif datatype == "ColorSequenceKeypoint" then 
		return("ColorSequenceKeypoint.new("..str..")")
	elseif datatype == "DateTime" then 
		print("x")
	end
end
