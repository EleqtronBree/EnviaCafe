--[[
Author(s): Electra Bree
Created in 2017

This script sets up everything when a player joins the game
This script no longer works due to Roblox updates and should only be used for reference
]]--

--// Variables
GroupID = 2988090 
VerifiedHats = {1567446, 102611803}

--// Gives the gear to a given player
function Gear(Player)
	if Player.StarterGear:FindFirstChild("PopCake") == nil then
		script["Premium"].PopCake:Clone().Parent = Player.Backpack 
		script["Premium"].PopCake:Clone().Parent = Player.StarterGear 
	end
	if Player.StarterGear:FindFirstChild("HandlessSegway") == nil then
		script["Premium"].HandlessSegway:Clone().Parent = Player.Backpack 
		script["Premium"].HandlessSegway:Clone().Parent = Player.StarterGear 
	end
end

--// Allocates a name color to a given player based on their role/rank
function Chat(Player)
	local CustomerColor = {
	Color3.fromRGB(180, 128, 255),--"Bright violet",
	Color3.fromRGB(255, 154, 76),--"Bright orange",
	Color3.fromRGB(255, 211, 50),--"Bright yellow",
	Color3.fromRGB(255, 102, 204),--"Pink",
	Color3.fromRGB(255, 154, 76),--"Orange",
	Color3.fromRGB(255, 50, 36),--"Bright red",
	Color3.fromRGB(19, 157, 255),--"Bright blue",
	Color3.fromRGB(224, 255, 96)--"Bright green"
	}		
	local ChatValue = Instance.new('Folder',Player)
	ChatValue.Name = 'ChatValue'
	local NameColor = Instance.new('Color3Value',ChatValue)
	NameColor.Name = 'NameColor'
	local Tag = Instance.new('StringValue',ChatValue)
	Tag.Name = 'Tag'
	--// PREMIUM + AMBASSADOR
	if Player:GetRankInGroup(2988090) == 2 or Player:GetRankInGroup(2988090) == 3 then 
		Tag.Value = "[".. tostring(Player:GetRoleInGroup(2988090)) .."] "
		NameColor.Value = Color3.fromRGB(255, 92, 95) -- Red
	--// PARTNER
	elseif Player:GetRankInGroup(2988090) == 3 then 
		Tag.Value = "[".. tostring(Player:GetRoleInGroup(2988090)) .."] "
		NameColor.Value = Color3.fromRGB(255, 149, 62) -- Orange
	--// TRAINEE 
	elseif Player:GetRankInGroup(2988090) == 4 and Player:GetRankInGroup(2988090) < 8 then 
		Tag.Value = "[".. tostring(Player:GetRoleInGroup(2988090)) .."] "
		NameColor.Value = Color3.fromRGB(255,217,0) -- Yellow
	--// LR
	elseif Player:GetRankInGroup(2988090) > 4 and Player:GetRankInGroup(2988090) < 9 then 
		Tag.Value = "[".. tostring(Player:GetRoleInGroup(2988090)) .."] "
		NameColor.Value = Color3.fromRGB(53, 255, 117) -- Green
	--// MR
	elseif Player:GetRankInGroup(2988090) > 8 and Player:GetRankInGroup(2988090) < 20 then 
		Tag.Value = "[".. tostring(Player:GetRoleInGroup(2988090)) .."] "
		NameColor.Value = Color3.fromRGB(85, 255, 255) -- Cyan
	--// HR
	elseif Player:GetRankInGroup(2988090) > 240 and Player:GetRankInGroup(2988090) < 252 then 
		local Role = (Player:GetRoleInGroup(2988090)):match(" %a- ")
		Tag.Value = "[".. (Role):match("%a+") .."] "
		NameColor.Value = Color3.fromRGB(187, 92, 255) -- Lavender
	--// Vice President
	elseif Player:GetRankInGroup(2988090) == 252 then 
		Tag.Value = "[VP] "
		NameColor.Value = Color3.fromRGB(255, 55, 115) -- Pink
	--// Delta
	elseif Player:GetRankInGroup(2988090) == 253 then 
		Tag.Value = "[Delta] "
		NameColor.Value = Color3.fromRGB(255, 55, 115) -- Pink
	--// Beta
	elseif Player:GetRankInGroup(2988090) == 254 then 
		Tag.Value = "[Beta] "
		NameColor.Value = Color3.fromRGB(255, 255, 255) -- White
	--// Alpha
	elseif Player:GetRankInGroup(2988090) == 255 then 
		Tag.Value = "[Alpha] "
		NameColor.Value = Color3.fromRGB(255, 255, 255) -- White
	else 
		NameColor.Value = CustomerColor[math.random(1,#CustomerColor)]
	end 
end

function Respawned(Player)
	repeat wait() until game.ServerScriptService["Trello Network"].Load.Premium.Value == true
	repeat wait() until game.ServerScriptService["Trello Network"].Load.GiveAway.Value == true
	--// Billboard UI
	Chat(Player)
	Player.Character.Humanoid.DisplayDistanceType = "None"
	if Player.Character.Head:FindFirstChild("BillboardGui") == nil then
		local GUI = script.BillboardGui:Clone()
		GUI.Parent = Player.Character.Head 
		GUI.Adornee = Player.Character.Head
		GUI.Rank.Text = Player:GetRoleInGroup(GroupID)
		GUI.Title.Text = Player.Name 
	end
	--// Verified player
	if game:GetService('MarketplaceService'):PlayerOwnsAsset(Player,1567446) or game:GetService('MarketplaceService'):PlayerOwnsAsset(Player,102611803) then
		Player.Character.Head.BillboardGui.Rank.TextColor3 = Color3.new(1,1,1)
		Player.Character.Head.BillboardGui.Title.TextColor3 = Color3.new(1,1,1) 
	end
	--// Load badge items
	if not game:GetService("BadgeService"):UserHasBadge(Player.UserId,1399651107) then 
		local Premium = Instance.new("BoolValue",Player)
		Premium.Name = "Premium" 
		game:GetService("BadgeService"):AwardBadge(Player.UserId,1399651107)
		if Player:GetRankInGroup(GroupID) < 2 then -- Customer or below
			Player.Character.Head:FindFirstChild("BillboardGui").Rank.Text = "New Visitor" 
			Player.Character.Head:FindFirstChild("BillboardGui").Title.TextColor3 = Color3.fromRGB(85, 255, 127)
			Player.Character.Head:FindFirstChild("BillboardGui").Rank.TextColor3 = Color3.fromRGB(85, 255, 127) 
		end 
		game:GetService("BadgeService"):AwardBadge(Player.UserId,1399651107) 
	end
	--// Load Staff UI
	if (Player:GetRankInGroup(2988090) > 4 or Player.Character.Head:FindFirstChild("BillboardGui").Rank.Text == "Barista") and game.Players:FindFirstChild(Player.Name).PlayerGui:FindFirstChild("StaffGui") == nil then
		script.StaffGui:Clone().Parent = game.Players:FindFirstChild(Player.Name).PlayerGui 
	end
	--// Load Premium Items
	for _,User in pairs(script.Parent["Trello Network"].Premium:GetChildren()) do 
		if tostring(User.Value) == tostring(Player.UserId) then 
			Gear(Player)
		elseif game:GetService("GamePassService"):PlayerHasPass(Player,572367075) then 
			local StringValue = Instance.new("StringValue",game.ServerScriptService["Trello Network"].Premium)
			StringValue.Value = tostring(Player.UserId)
			Gear(Player) 
		elseif Player:FindFirstChild("Premium") then
			Gear(Player) 
		end
	end 
	--// Load Giveaway items
	if Player.Character:FindFirstChild("Wings") == nil then 
		for _,User in pairs(script.Parent["Trello Network"].GiveAway:GetChildren()) do 
			if tostring(User.Value) == tostring(Player.UserId) then 
				script.LocalScript:Clone().Parent = Player.Character 
			elseif game:GetService("GamePassService"):PlayerHasPass(Player,1287030675) then 
				local StringValue = Instance.new("StringValue",game.ServerScriptService["Trello Network"].GiveAway)
				StringValue.Value = tostring(Player.UserId)
				script.LocalScript:Clone().Parent = Player.Character 
			end
		end 
	end 
end

--// Event triggered when player joins game
game.Players.PlayerAdded:connect(function(Player) 
	repeat 
		wait() 
	until 
		game.ServerScriptService["Trello Network"].Load.Banned.Value == true
	if game.ServerStorage:FindFirstChild("Banned") then 
		for _,User in pairs(game.ServerStorage["Banned"]:GetChildren()) do
			if User.Name == Player.Name then 
				Player:Kick("You are banned from the server. Violation: "..User.Value) 
				return
			end 
		end 
	end 
	Respawned(Player)
	--// Event triggered when player resets or joins
	Player.Changed:connect(function(Property)
		if Property == "Character" then Respawned(Player) end 
	end) 
end)
