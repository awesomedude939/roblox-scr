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
	if mouse.Target:FindFirstChildOfClass("ClickDetector") or mouse.Target.ClassName == "ClickDetector" then 
		if mouse.Target.ClassName == "ClickDetector" then 
			fireclickdetector(mouse.Target)
		else 
			fireclickdetector(mouse.Target:FindFirstChildOfClass("ClickDetector"))
		end
	end
	end)
end)
