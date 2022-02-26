if not fireclickdetector then return end

local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local mouseicon = "rbxasset://textures\\DragCursor.png"

spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if mouse.Target == "ClickDetector" or mouse.Target:FindFirstChildOfClass("ClickDetector") then 
				mouse.Icon = mouseicon
			else
				mouse.Icon = ""
			end
		end)
	end)
end)

mouse.Button1Down:Connect(function()
	pcall(function()
		if mouse.Target.ClassName == "ClickDetector" then 
			fireclickdetector(mouse.Target)
		elseif mouse.Target:FindFirstChildOfClass("ClickDetector") then
			fireclickdetector(mouse.Target:FindFirstChildOfClass("ClickDetector"))
		end
	end)
end)
