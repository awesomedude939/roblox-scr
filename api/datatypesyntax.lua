function getdatatype(datatype,str)
  if datatype == "Axes" then
    return("Axes.new("..str..")")
  elseif datatype = "BrickColor" then 
    return("BrickColor.new("..str..")")
  end
end
