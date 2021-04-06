--[[
Author(s): Electra Bree
Created in 2017

This script manages virtual currency transactions made in-game
]]--

--// Variables
local DataStore = game:GetService("DataStoreService"):GetDataStore("PurchaseHistory")

game:GetService("MarketplaceService").ProcessReceipt = function(ReceiptInfo) 
	for i, Player in ipairs(game.Players:GetChildren()) do
		if Player.UserId == ReceiptInfo.PlayerId then
			--// Donations
			if ReceiptInfo.ProductId == 49564706 then -- Popkake 3R 
				if Player:WaitForChild("Backpack"):FindFirstChild("PopCake") then 
					return 
				end
				game.ServerStorage.PopCake:Clone().Parent = Player:WaitForChild("Backpack")
				game.ServerStorage.PopCake:Clone().Parent = Player:WaitForChild("StarterGear")
			--// Subscription
			elseif ReceiptInfo.ProductId == 49161511 then
				Player.PlayerGui.Subscription.Intro.Purchase.Visible = false
			--// Music playlist fees
			elseif ReceiptInfo.ProductId == 49353951 or ReceiptInfo.ProductId == 129147043 then 
				Player.PlayerGui.MusicGui["Frame"].Visible = false
				Player.PlayerGui.MusicGui["Playlist"].Visible = true
			--// Custom song fees
			elseif ReceiptInfo.ProductId == 49354169 or ReceiptInfo.ProductId == 129148558 or ReceiptInfo.ProductId == 129148730 then
				Player.PlayerGui.MusicGui["Frame"].Visible = false
				Player.PlayerGui.MusicGui["Custom"].Visible = true
			end
		end
	end

	local PlayerProductKey = "p_" .. ReceiptInfo.PlayerId .. "_p_" .. ReceiptInfo.PurchaseId
	DataStore:IncrementAsync(PlayerProductKey, 1)	
	return Enum.ProductPurchaseDecision.PurchaseGranted		
end
