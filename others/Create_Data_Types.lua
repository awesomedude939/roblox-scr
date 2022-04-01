getgenv().Gtypeofs = {}
getgenv().Gtypes = {}

function create_data_type(typeof_name,type_name,value)
    pcall(function()
        table.insert(getgenv().Gtypeofs,{["name"] = typeof_name,["value"] = value})
    end)
    pcall(function()
        table.insert(getgenv().Gtypes,{["name"] = type_name,["value"] = value})
    end)
end
if getgenv().Gtypeshooked == true then return end
new_type = hookfunction(type,function(...)
    local args = {...}
    for i,v in pairs(getgenv().Gtypes) do 
        if args[1] == v.value then 
             return(v.name)
        end
    end
    return new_type(...)
end)

new_typeof = hookfunction(typeof,function(...)
    local args = {...}
    for i,v in pairs(getgenv().Gtypeofs) do 
        if args[1] == v.value then 
             return(v.name)
        end
    end
    return new_typeof(...)
end)

getgenv().Gtypeshooked = true
