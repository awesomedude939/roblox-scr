rconsoleclear()
local ignore = {"ClassName", "Name", "Parent", "Archivable","UIListLayout","1Topbar"}
local oldclasses = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/awesomedude939/retro-studio/main/json/classes.json"))
function getyear(c)
    for i,v in pairs(oldclasses) do 
        if string.split(v, " ")[1] == c and string.split(v, " ")[2] then 
            return string.split(v, " ")[2]
        end
    end
    return 0
end 

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
		if name and (not tonumber(name) and spoken["Arguments"][3])  then
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
		else 
			local pgui = game:GetService("Players").LocalPlayer.PlayerGui
			local selection = game.Players.LocalPlayer.PlayerScripts.SelectionService.GetSelection:Invoke()

			if selection then
				if #selection == 1 then
					local RobloxName = selection.ClassName
					local RetroName = nil
					local Year = tonumber(name) or 0
					for i,v in pairs(pgui.StudioGui.Properties.ListOutline.PropertyList:GetChildren()) do 
						if v.Name == "CategoryTemplate" then 
							for i1,v1 in pairs(v:GetChildren()) do 
								if v1.Name == "ClassName" then 
									RetroName = v1.ValueHalf.Object.Text
								end
							end
						end
					end
					local template2 = copytable(template["class"])

					template2.Name = RetroName
					template2.Year = Year
					template2.RBSName = RobloxName
					all[RetroName] = template2
					selectedclass = all[RetroName]
					local proplist = game:GetService("Players").LocalPlayer.PlayerGui.StudioGui.Properties.ListOutline.PropertyList

					for i,v in pairs(proplist:GetChildren()) do 
						if v.Name == "CategoryTemplate" then 
							for i1,v1 in pairs(v:GetChildren()) do 
								if not table.find(ignore, v1.Name) then 
									local template2 = copytable(template["prop"])
									template2.Name = v1.Name
									template2.Readonly = v1.CanSelect.Value
									selectedclass["Properties"][v1.Name] = template2
								end
							end
						end
					end  
					rconsoleprint("Class Created and selected.\n")
				else 
				    for i,v in pairs(selection) do 
					local RobloxName = selection.ClassName
					local RetroName = nil
					for i,v in pairs(pgui.StudioGui.Properties.ListOutline.PropertyList:GetChildren()) do 
						if v.Name == "CategoryTemplate" then 
							for i1,v1 in pairs(v:GetChildren()) do 
								if v1.Name == "ClassName" then 
									RetroName = v1.ValueHalf.Object.Text
								end
							end
						end
					end
					local Year = getyear(RetroName)
					local template2 = copytable(template["class"])

					template2.Name = RetroName
					template2.Year = Year
					template2.RBSName = RobloxName
					all[RetroName] = template2
					selectedclass = all[RetroName]
					local proplist = game:GetService("Players").LocalPlayer.PlayerGui.StudioGui.Properties.ListOutline.PropertyList

					for i,v in pairs(proplist:GetChildren()) do 
						if v.Name == "CategoryTemplate" then 
							for i1,v1 in pairs(v:GetChildren()) do 
								if not table.find(ignore, v1.Name) then 
									local template2 = copytable(template["prop"])
									template2.Name = v1.Name
									template2.Readonly = v1.CanSelect.Value
									selectedclass["Properties"][v1.Name] = template2
								end
							end
						end
					end  
					end
					rconsoleprint("All classes have been created and selected.\n")
				end
			else 
				rconsoleprint("You must select an instance before this command.")
			end
		end
	elseif iscmd("setprops") then 
		local proplist = game:GetService("Players").LocalPlayer.PlayerGui.StudioGui.Properties.ListOutline.PropertyList

		for i,v in pairs(proplist:GetChildren()) do 
			if v.Name == "CategoryTemplate" then 
				for i1,v1 in pairs(v:GetChildren()) do 
					if not table.find(ignore, v1.Name) then 
						local template2 = copytable(template["prop"])
						template2.Name = v1.Name
						template2.Readonly = v1.CanSelect.Value
						selectedclass["Properties"][v1.Name] = template2
					end
				end
			end
		end  

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
			writefile(filename..".txt", result)
			rconsoleprint("Result has been saved to workspace.\n")
		end)
		if not s and e then 
			printconsole(tostring(e),255,0,0)
			rconsoleprint("Fail to save result to workspace. Error has been printed to console\n")
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
