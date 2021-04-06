--[[
Author(s): Electra Bree
Created in 2017

This script transitions a color object across the colors of the rainbow
Since the discovery of HSV, this script is no longer used
]]--

--// Variables 
local R = 255
local G = 0
local B = 0 

script.Color.Value = Color3.fromRGB(255,0,0)

while wait() do
	while G < 255 do -- Increase Green
		G = G + 15
		script.Color.Value = Color3.fromRGB(255,G,0)
		wait() 
	end

	while R > 0 do -- Decrease Red
		R = R - 15
		script.Color.Value = Color3.fromRGB(R,255,0)
		wait() 
	end

	while B < 255 do -- Increase Blue
		B = B + 15
		script.Color.Value = Color3.fromRGB(0,255,B)
		wait() 
	end

	while G > 0 do -- Decrease Green
		G = G - 18 
		script.Color.Value = Color3.fromRGB(0,G,255)
		wait() 
	end

	while R < 255 do -- Increase Red
		R = R + 15 
		script.Color.Value = Color3.fromRGB(R,0,255)
		wait() 
	end

	while B > 0 do -- Decrease Blue
		B = B - 15
		script.Color.Value = Color3.fromRGB(255,0,B)
		wait()
	end
end