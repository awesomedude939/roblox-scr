local auto_update = false
local asset_type = 1 -- 1 : decal | 2 : audio
local aslist = {}

-- Gui to Lua V3.2

local D = Instance.new("ScreenGui")
local audiopreviewgui = Instance.new("ScreenGui")
local audiopreview = Instance.new("Sound")
local main = Instance.new("Frame")
local window = Instance.new("Frame")
local ad_option = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local decal = Instance.new("Frame")
local img1 = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local sound = Instance.new("Frame")
local img2 = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local adbtn = Instance.new("TextButton")
local listframe = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local default = Instance.new("Frame")
local dimage = Instance.new("ImageButton")
local dname = Instance.new("TextLabel")
local setclipbbtn = Instance.new("TextButton")
local buttons = Instance.new("Frame")
local updlistf = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local savelistf = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local clearlistf = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local autoupdlistf = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local autoupdlabel = Instance.new("TextLabel")
local name = Instance.new("TextLabel")
local closebtn = Instance.new("ImageButton")
local minbtn = Instance.new("ImageButton")
local title = Instance.new("TextLabel")

D.Name = "D"
if syn then syn.protect_gui(D) end
D.Parent = game.CoreGui
D.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
audiopreview.Parent = D
audiopreview.Name = "audiopreview"
audiopreviewgui.Name = "audiopreviewgui"
if syn then syn.protect_gui(audiopreviewgui) end
audiopreviewgui.Parent = game.Players.LocalPlayer.PlayerGui
audiopreviewgui.ResetOnSpawn = false
audiopreviewgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.Name = "main"
main.Parent = D
main.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.128177956, 0, 0.336956501, 0)
main.Size = UDim2.new(0, 256, 0, 23)
main.Active = true
main.Draggable = true

window.Name = "window"
window.Parent = main
window.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
window.BorderSizePixel = 0
window.Position = UDim2.new(0, 0, 1.00000072, 0)
window.Size = UDim2.new(0, 256, 0, 200)

ad_option.Name = "ad_option"
ad_option.Parent = window
ad_option.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
ad_option.Position = UDim2.new(0.6953125, 0, 0.0299999993, 0)
ad_option.Size = UDim2.new(0.3046875, 0, 0.14508529, 0)

UICorner.Parent = ad_option

decal.Name = "decal"
decal.Parent = ad_option
decal.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
decal.BorderColor3 = Color3.fromRGB(27, 42, 53)
decal.BorderSizePixel = 0
decal.Position = UDim2.new(0.506825745, 0, 0.0504584983, 0)
decal.Size = UDim2.new(0, 36, 0, 26)

img1.Name = "img1"
img1.Parent = decal
img1.BackgroundColor3 = Color3.fromRGB(127, 127, 127)
img1.BackgroundTransparency = 1.000
img1.Position = UDim2.new(0.200000003, 0, 0.0659999996, 0)
img1.Size = UDim2.new(0, 22, 0, 22)
img1.Image = "rbxassetid://8551251514"

UICorner_2.Parent = decal

sound.Name = "sound"
sound.Parent = ad_option
sound.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
sound.BackgroundTransparency = 1.000
sound.BorderSizePixel = 0
sound.Position = UDim2.new(0.0238909591, 0, 0.0504584983, 0)
sound.Size = UDim2.new(0, 36, 0, 26)

img2.Name = "img2"
img2.Parent = sound
img2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
img2.BackgroundTransparency = 1.000
img2.Position = UDim2.new(0.188467234, 0, 0.0660605803, 0)
img2.Size = UDim2.new(0, 22, 0, 22)
img2.Image = "rbxassetid://8551251221"

UICorner_3.Parent = sound

adbtn.Name = "adbtn"
adbtn.Parent = ad_option
adbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
adbtn.BackgroundTransparency = 1.000
adbtn.Position = UDim2.new(0, 0, 0.0344624892, 0)
adbtn.Size = UDim2.new(0, 78, 0, 28)
adbtn.Font = Enum.Font.SourceSans
adbtn.Text = ""
adbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
adbtn.TextSize = 14.000
adbtn.MouseButton1Click:Connect(function()
	if asset_type == 1 then 
		aslist = {}
		listframe.CanvasSize = UDim2.new(0,0,0,0)
		for i,v in pairs(listframe:GetChildren()) do 
			if not v:IsA("UIListLayout") then 
				v:Destroy()
			end
		end
		asset_type = 2
		decal.BackgroundTransparency = 1
		sound.BackgroundTransparency = 0
		aslist = {}
	elseif asset_type == 2 then
		aslist = {}
		listframe.CanvasSize = UDim2.new(0,0,0,0)
		for i,v in pairs(listframe:GetChildren()) do 
			if not v:IsA("UIListLayout") then 
				v:Destroy()
			end
		end
		asset_type = 1
		decal.BackgroundTransparency = 0
		sound.BackgroundTransparency = 1
		aslist = {}
	end
end)


listframe.Name = "listframe"
listframe.Parent = window
listframe.Active = true
listframe.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
listframe.BorderSizePixel = 0
listframe.Position = UDim2.new(0.03515625, 0, 0.174999997, 0)
listframe.Size = UDim2.new(0, 156, 0, 156)
listframe.CanvasSize = UDim2.new(0, 0, 0, 0)

UIListLayout.Parent = listframe
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

default.Name = "default"
default.Parent = listframe
default.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
default.Size = UDim2.new(0, 122, 0, 53)
default.Visible = false

dimage.Name = "dimage"
dimage.Parent = default
dimage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dimage.BorderSizePixel = 0
dimage.Size = UDim2.new(0, 60, 0, 53)
dimage.Image = "rbxassetid://8551646263"

dname.Name = "dname"
dname.Parent = default
dname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dname.BackgroundTransparency = 1.000
dname.Position = UDim2.new(0.486443937, 0, 0, 0)
dname.Size = UDim2.new(0, 62, 0, 29)
dname.Font = Enum.Font.SourceSans
dname.Text = "Unable to load"
dname.TextColor3 = Color3.fromRGB(255, 255, 255)
dname.TextSize = 14.000
dname.TextWrapped = true

setclipbbtn.Name = "setclipbbtn"
setclipbbtn.Parent = default
setclipbbtn.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
setclipbbtn.BorderSizePixel = 0
setclipbbtn.Position = UDim2.new(0.486443937, 0, 0.584905684, 0)
setclipbbtn.Size = UDim2.new(0, 62, 0, 22)
setclipbbtn.Font = Enum.Font.SourceSans
setclipbbtn.Text = "Set Clipboard"
setclipbbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
setclipbbtn.TextScaled = true
setclipbbtn.TextSize = 14.000
setclipbbtn.TextWrapped = true

buttons.Name = "buttons"
buttons.Parent = window
buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttons.BackgroundTransparency = 1.000
buttons.Position = UDim2.new(0.6953125, 0, 0.209999993, 0)
buttons.Size = UDim2.new(0, 68, 0, 149)

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = updlistf

UIListLayout_2.Parent = buttons
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 2)

savelistf.Name = "savelistf"
savelistf.Parent = buttons
savelistf.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
savelistf.Position = UDim2.new(0.6953125, 0, 0.209999993, 0)
savelistf.Size = UDim2.new(0, 68, 0, 22)
savelistf.Font = Enum.Font.SourceSans
savelistf.Text = "Export List"
savelistf.TextColor3 = Color3.fromRGB(255, 255, 255)
savelistf.TextSize = 16.000
savelistf.TextWrapped = true
savelistf.MouseButton1Click:Connect(function()
	local name = "dlogger_"..tostring(math.random(1,99999999))..".txt"
	local document = "{"
	for i,v in pairs(aslist) do
	    local id = string.gsub(v,"%D+","")
		if string.match(id,"420420$") then  
			id = string.gsub(id,"420420","")
		end
		local success = pcall(function()
		    if game:GetService("MarketplaceService"):GetProductInfo(id).AssetTypeId == 1 or game:GetService("MarketplaceService"):GetProductInfo(id).AssetTypeId == 3 then end
		end)
		if success then
		    if i ~= #aslist then 
		document = document..""..id..","
		else 
		 document = document..""..id
		end
		end
    end
	
	document = document.."}"
	writefile(name,document)
end)

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = savelistf

clearlistf.Name = "clearlistf"
clearlistf.Parent = buttons
clearlistf.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
clearlistf.Position = UDim2.new(0.6953125, 0, 0.209999993, 0)
clearlistf.Size = UDim2.new(0, 68, 0, 22)
clearlistf.Font = Enum.Font.SourceSans
clearlistf.Text = "Clear List"
clearlistf.TextColor3 = Color3.fromRGB(255, 255, 255)
clearlistf.TextSize = 16.000
clearlistf.TextWrapped = true
clearlistf.MouseButton1Click:Connect(function()
	aslist = {}
	listframe.CanvasSize = UDim2.new(0,0,0,0)
	for i,v in pairs(listframe:GetChildren()) do 
		if not v:IsA("UIListLayout") then 
			v:Destroy()
		end
	end
end)

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = clearlistf

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = autoupdlistf

autoupdlistf.Name = "autoupdlistf"
autoupdlistf.Parent = buttons
autoupdlistf.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
autoupdlistf.Position = UDim2.new(0.6953125, 0, 0.209999993, 0)
autoupdlistf.Size = UDim2.new(0, 68, 0, 22)
autoupdlistf.Font = Enum.Font.SourceSans
autoupdlistf.Text = "Auto-Update"
autoupdlistf.TextColor3 = Color3.fromRGB(255, 255, 255)
autoupdlistf.TextScaled = true
autoupdlistf.TextSize = 16.000
autoupdlistf.TextWrapped = true
autoupdlistf.MouseButton1Click:Connect(function()
	auto_update = not auto_update
	autoupdlabel.Text = "Auto-Update "..tostring(auto_update)
end)

autoupdlabel.Name = "autoupdlabel"
autoupdlabel.Parent = window
autoupdlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoupdlabel.BackgroundTransparency = 1.000
autoupdlabel.Position = UDim2.new(0.6953125, 0, 0.704999983, 0)
autoupdlabel.Size = UDim2.new(0, 68, 0, 50)
autoupdlabel.Font = Enum.Font.SourceSans
autoupdlabel.Text = "Auto-Update "..tostring(auto_update)
autoupdlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
autoupdlabel.TextScaled = true
autoupdlabel.TextSize = 14.000
autoupdlabel.TextWrapped = true

name.Name = "name"
name.Parent = window
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.Position = UDim2.new(0.03515625, 0, 0.0299999993, 0)
name.Size = UDim2.new(0, 156, 0, 19)
name.Font = Enum.Font.SourceSans
name.Text = "Made by awesomedude939"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextScaled = true
name.TextSize = 14.000
name.TextWrapped = true

closebtn.Name = "closebtn"
closebtn.Parent = main
closebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closebtn.BackgroundTransparency = 1.000
closebtn.Position = UDim2.new(0.90625, 0, 0, 0)
closebtn.Size = UDim2.new(0, 24, 0, 23)
closebtn.Image = "rbxassetid://8551425886"
closebtn.MouseButton1Click:Connect(function()
	D:Destroy()
	audiopreviewgui:Destroy()
	script.Disabled = true
end)

minbtn.Name = "minbtn"
minbtn.Parent = main
minbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minbtn.BackgroundTransparency = 1.000
minbtn.Position = UDim2.new(0.8125, 0, 0, 0)
minbtn.Size = UDim2.new(0, 24, 0, 23)
minbtn.Image = "rbxassetid://8551430986"
minbtn.MouseButton1Click:Connect(function()
	window.Visible = not window.Visible
end)

title.Name = "title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.03515625, 0, 0, 0)
title.Size = UDim2.new(0, 135, 0, 23)
title.Font = Enum.Font.SourceSansBold
title.Text = "Decal Logger V1.0"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left

function update(auto)
	if auto == true then 
		aslist = {}
		listframe.CanvasSize = UDim2.new(0,0,0,0)
		for i,v in pairs(listframe:GetChildren()) do 
			if not v:IsA("UIListLayout") then 
				v:Destroy()
			end
		end
	end
	for i,v in pairs(game:GetDescendants()) do 
		if asset_type == 1 then
			if v:IsA("Decal") or v:IsA("Texture") then 
				if not table.find(aslist,v.Texture) then 
					table.insert(aslist,v.Texture)
				end
			end
		elseif asset_type == 2 then
			if v:IsA("Sound") then 
				if not table.find(aslist,v.SoundId) then 
					table.insert(aslist,v.SoundId)
				end
			end
		end
	end
	for i,v in pairs(aslist) do
		listframe.CanvasSize = listframe.CanvasSize + UDim2.new(0,0,2,0)
		local new = default:Clone()
		local nsetclipbtn = setclipbbtn:Clone()
		local ndimage = dimage:Clone()
		local ndname = dname:Clone()

		new.Name = string.gsub(v,"%D+","")
		new.Parent = listframe
		new.Visible = true
		for _,v in pairs(new:GetChildren()) do 
			v:Destroy() 
		end
		nsetclipbtn.Parent = new
		ndimage.Parent = new
		if asset_type == 1 then
		ndimage.Image = v
		else 
		ndimage.Image = "rbxassetid://8551646263"    
		end
		ndimage.MouseButton1Click:Connect(function()
			if asset_type == 2 then
			if audiopreview.Playing == false then
				audiopreview.SoundId = v
				audiopreview:Play()
			else 
				audiopreview:Stop()
			end
			end
		end)
		ndname.Parent = new
		local id = string.gsub(v,"%D+","")
		if string.match(id,"420420$") then  
			id = string.gsub(id,"420420","")
		end
		local success = pcall(function()
		    local g = game:GetService("MarketplaceService"):GetProductInfo(id)
			ndname.Text = tostring(g.Name)
			nsetclipbtn.MouseButton1Click:Connect(function()
			    setclipboard(tostring(g.AssetId))
		    end)
		end)
		if not success then 
			new:Destroy()
		end
		wait(0.05)
	end
end

updlistf.Name = "updlistf"
updlistf.Parent = buttons
updlistf.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
updlistf.Position = UDim2.new(0.6953125, 0, 0.209999993, 0)
updlistf.Size = UDim2.new(0, 68, 0, 22)
updlistf.Font = Enum.Font.SourceSans
updlistf.Text = "Update List"
updlistf.TextColor3 = Color3.fromRGB(255, 255, 255)
updlistf.TextSize = 16.000
updlistf.TextWrapped = true
updlistf.MouseButton1Click:Connect(function()
	update()
end)

spawn(function()
	while wait() do 
		if main.Parent == nil then break end
		if auto_update then
			update()
		end
	end
end)
