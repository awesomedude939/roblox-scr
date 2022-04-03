return function(size,chars)
	if typeof(chars) ~= "string" or size == 1/0 or size == math.huge or size <= 0 or size == -math.huge or math.ceil(size) ~= math.floor(size) then 
		return ""
	end
	local stringreturn = ""
	co = string.split(chars,"")
	for i = 0,size do 
		stringreturn = stringreturn..co[math.random(#co)]
	end
	return stringreturn
end
