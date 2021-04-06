--[[
Author(s): Electra Bree
Created in 2017

This script loads and saves data (XP, Hours and Rank) to a datastore 
]]--

local EDS = game:GetService("DataStoreService"):GetDataStore("Experience")
local HDS = game:GetService("DataStoreService"):GetDataStore("Hours")
 
game.Players.PlayerAdded:connect(function(player)
	local LeaderStats = Instance.new('IntValue')
	LeaderStats.Name = 'leaderstats'
	LeaderStats.Parent = player

	local xp = Instance.new('IntValue')
	xp.Name = 'XP'
	xp.Parent = LeaderStats

	local hour = Instance.new('IntValue')
	hour.Name = 'Hours'
	hour.Parent = LeaderStats

	local rank = Instance.new("StringValue")
	rank.Name = "Rank"
	rank.Parent = LeaderStats
	rank.Value = player:GetRoleInGroup(2988090)
		
	local key = "user_" .. player.userId
	if EDS:GetAsync(key) then
		xp.Value = EDS:GetAsync(key)
	else
		EDS:SetAsync(key,0)
	end	

	if HDS:GetAsync(key) then
		hour.Value = HDS:GetAsync(key) 
	else
		HDS:SetAsync(key,0) 
	end	

	player.leaderstats.XP.Changed:connect(function()
		EDS:SetAsync(key, xp.Value)
	end)

	player.leaderstats.Hours.Changed:connect(function()
		HDS:SetAsync(key, hour.Value)
	end)
end)
