return function(color3)
    if color3.R < 1 then
        return Color3.new(1-color3.R,1-color3.G,1-color3.B)
    else
        return Color.fromRGB(255-color3.R,255-color3.G,255-color3.B)
    end
end
