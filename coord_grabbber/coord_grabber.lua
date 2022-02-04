-- awesomedude939, frosty GUI TO LUA

local Players = game:GetService("Players")
local TS = game:GetService("TweenService")
local plr = Players.LocalPlayer
local char = plr.Character
local plrlist = Players:GetChildren()
local target

local cordgrabber = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local window = Instance.new("Frame")
local localcords = Instance.new("TextLabel")
local writename = Instance.new("TextBox")
local arrowbtn = Instance.new("TextButton")
local arrowbtnimg = Instance.new("TextLabel")
local namelist = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local dbtn = Instance.new("TextButton")
local txt = Instance.new("TextLabel")
local plrcords = Instance.new("TextLabel")
local closebtn = Instance.new("TextButton")
local closebtnimg = Instance.new("ImageLabel")
local minbtn = Instance.new("TextButton")
local minbtnimg = Instance.new("ImageLabel")
local title = Instance.new("TextLabel")

function updatelist(filter)
	for i,v in pairs(namelist:GetChildren()) do 
		if v.Name ~= "dbtn" then 
			v:Destroy()
		end
	end
	
	for i,plr in pairs(plrlist) do 
		if filter == nil or string.match(string.lower(plr.Name),"^"..filter) or string.match(string.upper(plr.Name),"^"..filter) then 
			local btn = dbtn:Clone()
			btn.Visible = true
			btn.txt.Text = plr.Name
			btn.Name = plr.Name
			btn.Parent = namelist
			btn.MouseEnter:Connect(function()
				TS:Create(btn.txt,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
			end)
			btn.MouseLeave:Connect(function()
				TS:Create(btn.txt,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
			end)
			btn.MouseButton1Down:Connect(function()
				TS:Create(btn.txt,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
			end)
			btn.MouseButton1Up:Connect(function()
				TS:Create(btn.txt,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75,75,75)}):Play()
				target = plr
			end)
		end
	end
end

cordgrabber.Name = "cordgrabber"
if syn then 
	syn.protect_gui(cordgrabber)
end
cordgrabber.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
cordgrabber.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = cordgrabber
main.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.77275151, 0, 0.163666114, 0)
main.Size = UDim2.new(0, 239, 0, 28)

window.Name = "window"
window.Parent = main
window.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
window.BorderSizePixel = 0
window.Position = UDim2.new(0, 0, 0.978238523, 0)
window.Size = UDim2.new(0, 239, 0, 187)

localcords.Name = "localcords"
localcords.Parent = window
localcords.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
localcords.BackgroundTransparency = 1.000
localcords.Position = UDim2.new(-0.38075313, 0, 0.721925199, 0)
localcords.Size = UDim2.new(0, 419, 0, 24)
localcords.Font = Enum.Font.SourceSansBold
localcords.Text = "Your coordinates : (123, 123, 123)"
localcords.TextColor3 = Color3.fromRGB(255, 255, 255)
localcords.TextSize = 15.000
localcords.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
localcords.TextWrapped = true
spawn(function()
	while wait() do 
		localcords.Text = "Your coordinates : ("..math.round(char.HumanoidRootPart.Position.X)..", "..math.round(char.HumanoidRootPart.Position.Y)..", "..math.round(char.HumanoidRootPart.Position.Z)..")"
	end
end)

writename.Name = "writename"
writename.Parent = window
writename.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
writename.BorderSizePixel = 0
writename.Position = UDim2.new(0.079497911, 0, 0.0962566808, 0)
writename.Size = UDim2.new(0, 177, 0, 22)
writename.ClearTextOnFocus = false
writename.Font = Enum.Font.SourceSans
writename.Text = ""
writename.TextColor3 = Color3.fromRGB(255, 255, 255)
writename.TextSize = 14.000
writename.TextWrapped = true
writename:GetPropertyChangedSignal("Text"):Connect(function()
	if namelist.Visible == false then 
		namelist.Visible = true
		arrowbtnimg.Text = "/\\"
	end
	if writename.Text ~= "" and writename.Text ~= " " then 
		updatelist(writename.Text)
	else
		namelist.Visible = false 
		arrowbtnimg.Text = "\\/"
	end
end)

arrowbtn.Name = "arrowbtn"
arrowbtn.Parent = window
arrowbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
arrowbtn.BorderSizePixel = 0
arrowbtn.Position = UDim2.new(0.823054373, 0, 0.0962566808, 0)
arrowbtn.Size = UDim2.new(0, 22, 0, 22)
arrowbtn.Font = Enum.Font.SourceSansBold
arrowbtn.Text = ""
arrowbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
arrowbtn.TextScaled = true
arrowbtn.TextSize = 14.000
arrowbtn.TextWrapped = true
arrowbtn.MouseEnter:Connect(function()
	TS:Create(arrowbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
end)
arrowbtn.MouseLeave:Connect(function()
	TS:Create(arrowbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
end)
arrowbtn.MouseButton1Down:Connect(function()
	TS:Create(arrowbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
end)
arrowbtn.MouseButton1Up:Connect(function()
	TS:Create(arrowbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75,75,75)}):Play()
	if namelist.Visible == false then 
		arrowbtnimg.Text = "/\\"
		namelist.Visible = true
		updatelist()
	elseif namelist.Visible == true then
		arrowbtnimg.Text = "\\/"
		namelist.Visible = false
	end
end)

arrowbtnimg.Name = "arrowbtnimg"
arrowbtnimg.Parent = arrowbtn
arrowbtnimg.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
arrowbtnimg.BorderSizePixel = 0
arrowbtnimg.Size = UDim2.new(0, 22, 0, 22)
arrowbtnimg.Font = Enum.Font.SourceSansBold
arrowbtnimg.Text = "\\/"
arrowbtnimg.TextColor3 = Color3.fromRGB(255, 255, 255)
arrowbtnimg.TextScaled = true
arrowbtnimg.TextSize = 14.000
arrowbtnimg.TextWrapped = true

namelist.Name = "namelist"
namelist.Parent = window
namelist.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
namelist.Position = UDim2.new(0.079497911, 0, 0.21390374, 0)
namelist.Size = UDim2.new(0, 200, 0, 8)
namelist.Visible = false

UIListLayout.Parent = namelist
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

dbtn.Name = "dbtn"
dbtn.Parent = namelist
dbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dbtn.BorderSizePixel = 0
dbtn.Size = UDim2.new(0, 200, 0, 20)
dbtn.Visible = false
dbtn.Font = Enum.Font.SourceSans
dbtn.Text = ""
dbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
dbtn.TextSize = 14.000

txt.Name = "txt"
txt.Parent = dbtn
txt.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
txt.BorderSizePixel = 0
txt.Size = UDim2.new(0, 200, 0, 20)
txt.Font = Enum.Font.SourceSans
txt.TextColor3 = Color3.fromRGB(255, 255, 255)
txt.TextScaled = true
txt.TextSize = 14.000
txt.TextWrapped = true

plrcords.Name = "plrcords"
plrcords.Parent = window
plrcords.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
plrcords.BackgroundTransparency = 1.000
plrcords.Position = UDim2.new(-0.38075316, 0, 0.593582988, 0)
plrcords.Size = UDim2.new(0, 419, 0, 24)
plrcords.Font = Enum.Font.SourceSansBold
plrcords.Text = "Player coordinates : nil"
plrcords.TextColor3 = Color3.fromRGB(255, 255, 255)
plrcords.TextSize = 15.000
plrcords.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
plrcords.TextWrapped = true
spawn(function()
	while wait() do 
		if target ~= nil and typeof(target) == "Instance" then 
			plrcords.Text = "Player coordinates : ("..math.round(target.Character.HumanoidRootPart.Position.X)..", "..math.round(target.Character.HumanoidRootPart.Position.Y)..", "..math.round(target.Character.HumanoidRootPart.Position.Z)..")"
		end
	end
end)

closebtn.Name = "closebtn"
closebtn.Parent = main
closebtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
closebtn.BorderSizePixel = 0
closebtn.Position = UDim2.new(0.882845163, 0, 0, 0)
closebtn.Size = UDim2.new(0, 27, 0, 27)
closebtn.Font = Enum.Font.SourceSans
closebtn.Text = ""
closebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
closebtn.TextSize = 14.000
closebtn.TextWrapped = true
closebtn.MouseEnter:Connect(function()
	TS:Create(closebtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(180,0,0)}):Play()
end)
closebtn.MouseLeave:Connect(function()
	TS:Create(closebtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
end)
closebtn.MouseButton1Down:Connect(function()
	TS:Create(closebtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(110,0,0)}):Play()
end)
closebtn.MouseButton1Up:Connect(function()
	TS:Create(closebtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(180,0,0)}):Play()
	cordgrabber:Destroy()
	script.Disabled = true
end)

closebtnimg.Name = "closebtnimg"
closebtnimg.Parent = closebtn
closebtnimg.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
closebtnimg.BorderSizePixel = 0
closebtnimg.Position = UDim2.new(0, 0, 2.8257017e-07, 0)
closebtnimg.Size = UDim2.new(0, 28, 0, 27)
closebtnimg.Image = "rbxassetid://8730835395"

minbtn.Name = "minbtn"
minbtn.Parent = main
minbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
minbtn.BorderSizePixel = 0
minbtn.Position = UDim2.new(0.769874454, 0, 0, 0)
minbtn.Size = UDim2.new(0, 27, 0, 27)
minbtn.Font = Enum.Font.SourceSans
minbtn.Text = ""
minbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minbtn.TextSize = 14.000
minbtn.TextWrapped = true

minbtn.MouseEnter:Connect(function()
	TS:Create(minbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
end)
minbtn.MouseLeave:Connect(function()
	TS:Create(minbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
end)
minbtn.MouseButton1Down:Connect(function()
	TS:Create(minbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
end)
minbtn.MouseButton1Up:Connect(function()
	TS:Create(minbtnimg,TweenInfo.new(.15),{BackgroundColor3 = Color3.fromRGB(75,75,75)}):Play()
	if window.Visible == true then 
		minbtnimg.Image = "rbxassetid://8731325845"
	else 
		minbtnimg.Image = "rbxassetid://8730885504"
	end
	window.Visible = not window.Visible
end)

minbtnimg.Name = "minbtnimg"
minbtnimg.Parent = minbtn
minbtnimg.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
minbtnimg.BorderSizePixel = 0
minbtnimg.Position = UDim2.new(0, 0, 2.8257017e-07, 0)
minbtnimg.Size = UDim2.new(0, 28, 0, 27)
minbtnimg.Image = "rbxassetid://8730885504"

title.Name = "title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.0502092056, 0, 0, 0)
title.Size = UDim2.new(0, 134, 0, 26)
title.Font = Enum.Font.SourceSansBold
title.Text = "Coord Grabber"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 21.000
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left
