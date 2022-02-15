if not rconsoleclear or not rconsolename or not rconsoleprint or not rconsoleinput then return end
getgenv().ExcludeListRS = {}
rconsoleclear()
rconsolename("Adv Spy")
loadstring(game:HttpGet("https://raw.githubusercontent.com/awesomedude939/roblox-scr/main/adv_spy/getdatatype.lua"))()
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

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(...)
	local args = {...}
	local Self = args[1]
	local namecall = getnamecallmethod()
	local formatx = ""
	if namecall == "FireServer" and not table.find(getgenv().ExcludeListRS, Self.Name) then
	    pcall(function()
	    formatx = formatx..GetFullPathOfAnInstance(Self)
	    formatx = formatx..":FireServer("
	    local s,e = pcall(function()
	    for i,v in pairs(args) do 
	        if i ~= 1 and i ~= #args then 
	        formatx = formatx..getdatatype(typeof(v),v)..", "
	        elseif i == #args then
	            formatx = formatx..getdatatype(typeof(v),v)
	        end
	    end
	    end)
	    formatx = formatx..") \n"
	    s,e = pcall(function()
	    rconsoleprint(tostring(formatx))
	    end)
	    end)
	elseif namecall == "InvokeServer" and not table.find(getgenv().ExcludeListRS, Self.Name) then    
	    pcall(function()
	    formatx = formatx..GetFullPathOfAnInstance(Self)
	    formatx = formatx..":InvokeServer("
	    local s,e = pcall(function()
	    for i,v in pairs(args) do 
	        if i ~= 1 and i ~= #args then 
	        formatx = formatx..getdatatype(typeof(v),v)..", "
	        elseif i == #args then
	            formatx = formatx..getdatatype(typeof(v),v)
	        end
	    end
	    end)
	    formatx = formatx..") \n"
	    s,e = pcall(function()
	    rconsoleprint(tostring(formatx))
	    end)
	    end)
	end
	return OldNamecall(...)
end)
