--[[
Author(s): Electra Bree
Created in 2017

This script executes chat commands that are typed in game
]]--

game.Players.PlayerAdded:connect(function(player)
	player.Chatted:connect(function(message)	
		if message == ":wingsoff" and player.Character:FindFirstChild("Wings") ~= nil then
			player.Character["Wings"]:Destroy()
		end
		if message == ":wingson" and player.Character:FindFirstChild("Wings") == nil then 
			for _,User in pairs(script.Parent["Trello Network"].GiveAway:GetChildren()) do
				if User.Value == tostring(player.UserId) then
					script.Parent.PlayerJoin.LocalScript:Clone().Parent = player.Character 
				end 
			end 
		end
	end) 
end)