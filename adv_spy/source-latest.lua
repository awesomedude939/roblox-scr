if getgenv().AdvSpyExecuted then return end
getgenv().AdvSpyExecuted = true
getgenv().ExcludeListRS = {}
rconsoleclear()
rconsolename("Adv Spy 1.0.1")
if game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/awesomedude939/roblox-scr/main/adv_spy/version.json")).version ~= "1.0.1" then rconsoleprint("@@RED@@") rconsoleprint("--OUTDATED\n--Get updated version at https://github.com/awesomedude939/roblox-scr/tree/main/adv_spy\n") rconsoleprint("@@LIGHT_GRAY@@") end
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

function ov(namecall,args)
    formatx = ""
    formatx = formatx..GetFullPathOfAnInstance(args[1])
    formatx = formatx..":"..tostring(namecall).."("
    for i,v in pairs(args) do 
	        if i ~= 1 and i ~= #args then 
	        formatx = formatx..getdatatype(typeof(v),v)..", "
	        elseif i == #args then
	            formatx = formatx..getdatatype(typeof(v),v)
	        end
    end
    formatx = formatx..") \n"
    rconsoleprint(tostring(formatx))
end

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
	local args = {...}
	local namecall = getnamecallmethod()
	local formatx = ""
	if namecall == "FireServer" and not table.find(getgenv().ExcludeListRS, Self.Name) and Self.ClassName == "RemoteEvent" then
	    ov("FireServer",args)
	    return OldNamecall(unpack(args))
	elseif namecall == "InvokeServer" and not table.find(getgenv().ExcludeListRS, Self.Name) and Self.ClassName = "RemoteFunction" then    
	    ov("InvokeServer",args)
	    return OldNamecall(unpack(args))
	end
	return OldNamecall(...)
end)
