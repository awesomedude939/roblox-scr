local ignore = {"ClassName", "Name", "Parent", "Archivable"}
local template = {
	["class"] = {
		Name = "",
		RBSName = "",
		Year = 0,
		Properties = {}
	},

	["prop"] = {
		Name = "",
		Readonly = ""
	}
}
local all = {}
local selectedclass

function copytable(t)
	local copy = {}
	for i, v in pairs(t) do
		copy[i] = v
	end
	return copy
end

rconsolename("Retro Mounter")
rconsoleprint("Make the JSON table.\n")
while wait() do 
	local input = rconsoleinput()
	local spoken
	function splitspoken()
		local splitted = string.split(input," ")
		local fsplit = string.split(input,"")
		local result = {
			["Command"] = splitted[1],
			["Arguments"] = {

			}
		}
		local cstring = ""
		local bracketend = true
		local stringend = true 
		local previous = ""
		local argsfix = {

		}
		function inchar(char)
			cstring = cstring..char
			previous = char
		end

		for i,v in pairs(fsplit) do 
			if v == "\"" and previous ~= "\\" then 
				stringend = not stringend
			elseif v == ")" or v == "(" then 
				bracketend = not bracketend
			end
			if v == "\32" then 
				if stringend or bracketend then 
					table.insert(argsfix, cstring)
					cstring = ""
				else
					inchar(v)
				end
			else
				inchar(v)
			end
		end 

		table.insert(argsfix, cstring)
		result["Arguments"] = argsfix
		if not stringend or not bracketend then
			rconsoleprint("Malformatted Command.\n")
			return nil
		end 
		return result
	end
	spoken = splitspoken()
	function iscmd(cmd)
		if spoken["Command"] == cmd then 
			return true    
		end
	end

	if iscmd("finish") then 
		break
	elseif iscmd("newclass") then 
		local name = spoken["Arguments"][2]
		local rbsname = spoken["Arguments"][3]
		local year = tonumber(spoken["Arguments"][4])

		if not year or typeof(year) ~= "number" then 
			year = 0 
		end
		local template2 = copytable(template["class"])

		template2.Name = name
		template2.Year = year
		template2.RBSName = rbsname

		all[name] = template2
		selectedclass = all[name]
		rconsoleprint("Class Created and selected.\n")
	elseif iscmd("setprops") then 
		rconsoleprint("Properties have been sent to selected class.\n")
	elseif iscmd("selectclass") then 
		local name = spoken["Arguments"][2]
		if all[name] then 
			selectedclass = all[name]
			rconsoleprint("Selected.\n")
		else  
			rconsoleprint(string.format("There are no classes with the name \"%s\"\n", name))
		end
	end
end

local result = tostring(game:GetService("HttpService"):JSONEncode(all))

while wait() do 
	rconsoleprint("Select what to do with result.\n  [1] Set result to clipboard\n  [2] Save result to workspace\n  [3] Print result\n  [4] RConsole print result\n  [5] PrintConsole result\n  [6] Exit\n")
	local input = rconsoleinput()

	if input == "1" then 
		s,e = pcall(function()
			setclipboard(result)
			rconsoleprint("Result has been set to clipboard.\n")
		end)
		if not s and e then 
			rconsoleprint("Fail to set result to clipboard.\n")
		end
	elseif input == "2" then 
		rconsoleprint("Write the file name : ")
		local filename = rconsoleinput()

		s,e = pcall(function()
			writefile(filename, result)
			rconsoleprint("Result has been saved to workspace.\n")
		end)
		if not s and e then 
			rconsoleprint("Fail to save result to workspace.\n")
		end
	elseif input == "3" then 
		print(result)
	elseif input == "4" then 
		rconsoleprint(result.."\n\n")
	elseif input == "5" then
		printconsole(result)
	elseif input == "6" or input == "exit" then 
		break
	end
end
