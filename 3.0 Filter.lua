--[[
Author(s): Electra Bree
Created in 2017

This script changes the way players look in-game, giving aesthetic alternatives to default items.
]]--

--// Variables
girlshirts = 
	{"http://www.roblox.com/asset/?id=37143990",
	"http://www.roblox.com/asset/?id=38156195",
	"http://www.roblox.com/asset/?id=54128428",
	"http://www.roblox.com/asset/?id=54128450",
	"http://www.roblox.com/asset/?id=55297540",
	"http://www.roblox.com/asset/?id=46763666",
	"http://www.roblox.com/asset/?id=64972412",
	"http://www.roblox.com/asset/?id=454224442"}
girlpants =
	{"http://www.roblox.com/asset/?id=51189837",
	"http://www.roblox.com/asset/?id=52574049",
	"http://www.roblox.com/asset/?id=51189837",
	"http://www.roblox.com/asset/?id=40146941",
	"http://www.roblox.com/asset/?id=40135136"}	
boyshirts = 
	{"http://www.roblox.com/asset/?id=453401299",
	"http://www.roblox.com/asset/?id=453386449",
	"http://www.roblox.com/asset/?id=453386386",
	"http://www.roblox.com/asset/?id=453386295",
	"http://www.roblox.com/asset/?id=70412706",
	"http://www.roblox.com/asset/?id=76089706",
	"http://www.roblox.com/asset/?id=97301922",
	"http://www.roblox.com/asset/?id=453386330"}
boypants = 
	{"http://www.roblox.com/asset/?id=374757565",
	"http://www.roblox.com/asset/?id=68642003",	
	"http://www.roblox.com/asset/?id=181490321",
	"http://www.roblox.com/asset/?id=68642246",
	"http://www.roblox.com/asset/?id=68642219"}

game.Players.PlayerAdded:connect(function(Player)
	Player.CharacterAdded:connect(function(Character)
		repeat 
			wait() 
		until 
			Character:FindFirstChild("Torso") ~= nil
		wait(2)

		--// Tag new players
		if (Player.AccountAge < 30) then
			if Character:FindFirstChild("ShirtGraphic") == nil then
				local Tshirt = Instance.new("ShirtGraphic")
				Tshirt.Parent = Character
				Tshirt.Graphic = "http://www.roblox.com/asset/?id=452523122"
			elseif Character:FindFirstChild("ShirtGraphic") ~= nil then
				Character.ShirtGraphic.Graphic = "http://www.roblox.com/asset/?id=452523122"
			end 
		end

		--// Change default hats to alternatives
		--// SHAGGY 2.0
		if Character:FindFirstChild("Shaggy2") then
			Character.Shaggy2:Destroy()
			script.Hats.Shaggy:Clone().Parent = Character 
		end
		--// BLONDE SPIKED HAIR SPOTTED
		if Character:FindFirstChild("MessyHair") then
			Character.MessyHair:Destroy()
			script.Hats.BlondeCharmer:Clone().Parent = Character 
		end
		--// CHESTNUT BUN
		if Character:FindFirstChild("Kate Hair") then
			Character["Kate Hair"]:Destroy()
			script.Hats["Pinktastic Hair"]:Clone().Parent = Character 
		end	
		--// LAVENDER BUN 
		if Character:FindFirstChild("LavanderHair") then
			Character.LavanderHair:Destroy()
			script.Hats["Pinktastic Hair"]:Clone().Parent = Character 
		end
		--// DEFAULT SHADES
		if Character:FindFirstChild("VarietyShades02") or Character:FindFirstChild("VarietyShades10") then
			if Character:FindFirstChild("VarietyShades02") and Character:FindFirstChild("VarietyShades10") then -- In Rare Cases
				Character.VarietyShades10:Destroy()	
				Character.VarietyShades02:Destroy() 
			elseif Character:FindFirstChild("VarietyShades10") then 
				Character.VarietyShades10:Destroy()
			elseif Character:FindFirstChild("VarietyShades02") then 
				Character.VarietyShades02:Destroy() 
			end
			script.Hats.GlassesBlackFrame:Clone().Parent = Character 
		end
		--// 3.0 SLEEK HAIR
		if Character:FindFirstChild("Hat1") then
			Character.Hat1:Destroy()
			script.Hats["Ultra-Fabulous Hair"]:Clone().Parent = Character 
		end
		--// COOLBOYHAIR
		if Character:FindFirstChild("CoolBoyHair") then
			Character.CoolBoyHair:Destroy()
			script.Hats["Blue-Fabulous Hair"]:Clone().Parent = Character 
		end
		--// FREE BLONDE HAIR 
		if Character:FindFirstChild("LongStraightHair") then
			Character.LongStraightHair:Destroy()
			script.Hats["LongHairHeadBand"]:Clone().Parent = Character
			script.Hats["Skater"]:Clone().Parent = Character
			if Character.Head.face.Texture == "rbxasset://textures/face.png" or Character.Head.face.Texture == "http://www.roblox.com/asset/?id=144080495 " then
				Character.Head.face.Texture = "http://www.roblox.com/asset/?id=12451696" 
			end 
		end

		--// 3.0 Girl Assets
		--// Morph
		if Character:FindFirstChild("CharacterMesh") then
			if Character:FindFirstChild("CharacterMesh").MeshId == 82987757 or Character:FindFirstChild("CharacterMesh").MeshId == 83001137 or Character:FindFirstChild("CharacterMesh").MeshId == 83001181 or Character:FindFirstChild("CharacterMesh").MeshId == 746826007 or Character:FindFirstChild("CharacterMesh").MeshId == 746825633 then
				local Morph = Character:GetChildren()
				for i = 1, #Morph do
					if Morph[i].ClassName == "CharacterMesh" then Morph[i]:Destroy()
						if Character:FindFirstChild("Girltorso") == nil then
							script.Hats.Girltorso:clone().Parent = Character 
						end 
					end
				end 
			end 
		end
		--// Shirt
		if Character:FindFirstChild("Shirt") then
			if Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=144076435" then
				if Character["Right Arm"].BrickColor == BrickColor.new("Institutional white") and Character["Torso"].BrickColor ~= BrickColor.new("Institutional white") then
					Character.Shirt:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("White") and Character["Torso"].BrickColor ~= BrickColor.new("White") then
					Character.Shirt:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Light stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Light stone grey") then
					Character.Shirt:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Mid gray") and Character["Torso"].BrickColor ~= BrickColor.new("Mid gray") then
					Character.Shirt:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Medium stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Medium stone grey") then
					Character.Shirt:Destroy()
				else 
					Character.Shirt.ShirtTemplate = girlshirts[math.random(1,#girlshirts)]
				end	
			end 
		end
		--// Pants
		if Character:FindFirstChild("Pants") ~= nil then
			if Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=144076511" then
				if Character["Right Arm"].BrickColor == BrickColor.new("Institutional white") and Character["Torso"].BrickColor ~= BrickColor.new("Institutional white") then
					Character.Pants:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("White") and Character["Torso"].BrickColor ~= BrickColor.new("White") then
					Character.Pants:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Light stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Light stone grey") then
					Character.Pants:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Mid gray") and Character["Torso"].BrickColor ~= BrickColor.new("Mid gray") then
					Character.Pants:Destroy()
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Medium stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Medium stone grey") then
					Character.Pants:Destroy()
				else 
					Character.Pants.PantsTemplate = girlpants[math.random(1,#girlpants)] 
				end 
			end 
		end

		--// 3.0 Boy Assets
		--// Morph
		if Character:FindFirstChild("CharacterMesh") then
			if Character:FindFirstChild("CharacterMesh").MeshId == 82907945 or Character:FindFirstChild("CharacterMesh").MeshId == 81487640 or Character:FindFirstChild("CharacterMesh").MeshId == 82908019 or Character:FindFirstChild("CharacterMesh").MeshId == 82907977 or Character:FindFirstChild("CharacterMesh").MeshId == 81487710 then
				local Morph = Character:GetChildren()
				for i = 1, #Morph do
					if Morph[i].ClassName == "CharacterMesh" then
						Morph[i]:Destroy() end
					if Character:FindFirstChild("GlassesBlackFrame") then
						Character.Head.face.Texture = "http://www.roblox.com/asset/?id=31117192"
					end 
				end 
			end 
		end
		--// Shirt
		local Color = false
		if Character:FindFirstChild("Shirt") then
			if Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=144076357" then
				if Character["Right Arm"].BrickColor == BrickColor.new("Institutional white") and Character["Torso"].BrickColor ~= BrickColor.new("Institutional white") then
					Character.Shirt:destroy() Color = true
				elseif Character["Right Arm"].BrickColor == BrickColor.new("White") and Character["Torso"].BrickColor ~= BrickColor.new("White") then
					Character.Shirt:Destroy() Color = true
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Light stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Light stone grey") then
					Character.Shirt:Destroy() Color = true
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Mid gray") and Character["Torso"].BrickColor ~= BrickColor.new("Mid gray") then
					Character.Shirt:Destroy() Color = true
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Medium stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Medium stone grey") then
					Character.Shirt:Destroy() Color = true
				else 
					Color = false Character.Shirt.ShirtTemplate = boyshirts[math.random(1,#boyshirts)]
				end	
			end 
		end
		--// Hats
		if Character:FindFirstChild("Pal Hair") and Color == true then
			Character["Pal Hair"]:Destroy()
			script.Hats["Red Roblox Cap"]:Clone().Parent = Character
		elseif Character:FindFirstChild("Pal Hair") and Color == false then
			Character["Pal Hair"]:Destroy()
			script.Hats.Shaggy:Clone().Parent = Character
			script.Hats.Koala:Clone().Parent = Character
		end
		--// Pants
		if Character:FindFirstChild("Pants") then
			if Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=144076759" then
				if Character["Right Arm"].BrickColor == BrickColor.new("Institutional white") and Character["Torso"].BrickColor ~= BrickColor.new("Institutional white") then
					Character.Pants:Destroy()
					if Character:FindFirstChild("Pal Hair") then
						Character["Pal Hair"]:Destroy()
						script.Hats["Red Roblox Cap"]:Clone().Parent = Character 
					end
				elseif Character["Right Arm"].BrickColor == BrickColor.new("White") and Character["Torso"].BrickColor ~= BrickColor.new("White") then
					Character.Pants:Destroy()
					if Character:FindFirstChild("Pal Hair") then
						Character["Pal Hair"]:Destroy()
						script.Hats["Red Roblox Cap"]:Clone().Parent = Character 
					end
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Light stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Light stone grey") then
					Character.Pants:destroy()
					if Character:FindFirstChild("Pal Hair") then
						Character["Pal Hair"]:Destroy()
						script.Hats["Red Roblox Cap"]:Clone().Parent = Character 
					end
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Mid gray") and Character["Torso"].BrickColor ~= BrickColor.new("Mid gray") then
					Character.Pants:Destroy()
					if Character:FindFirstChild("Pal Hair") then
						Character["Pal Hair"]:Destroy()
						script.Hats["Red Roblox Cap"]:Clone().Parent = Character 
					end
				elseif Character["Right Arm"].BrickColor == BrickColor.new("Medium stone grey") and Character["Torso"].BrickColor ~= BrickColor.new("Medium stone grey") then
					Character.Pants:Destroy()
				else
					Character.Pants.PantsTemplate = boypants[math.random(1,#boypants)]
					if Character:FindFirstChild("Pal Hair") then
						Character["Pal Hair"]:Destroy()
						script.Hats.Shaggy:Clone().Parent = Character
						script.Hats.Koala:Clone().Parent = Character 
					end
				end	
			end 
		end

		--// Changes girl morph to 2.0 morph
		if Character:FindFirstChild("ROBLOX Girl Torso") then
			local Morph = Character:GetChildren()
			for i = 1, #Morph do
				if Morph[i].ClassName == "CharacterMesh" then Morph[i]:Destroy()
					for _,Package in pairs (script.Hats["2.0"]:GetChildren()) do
						Package:Clone().Parent = Character
					end 
				end 
			end
			if Character.Head.face.Texture == "http://www.roblox.com/asset/?id=83022608" then
				Character.Head.face.Texture = "http://www.roblox.com/asset/?id=12451696"
			elseif Character.Head.face.Texture == "http://www.roblox.com/asset/?id=144080495 " or Character.Head.face.Texture == "rbxasset://textures/face.png" then
				Character.Head.face.Texture = "http://www.roblox.com/asset/?id=12451696"
			end 
		end

		--// Changes boy morph to 2.0 morph
		if Character:FindFirstChild("ROBLOX Boy Torso") then
			local Morph = Character:GetChildren()
			for i = 1, #Morph do
				if Morph[i].ClassName == "CharacterMesh" then Morph[i]:Destroy()
					for _,Package in pairs (script.Hats["2.0"]:GetChildren()) do
						Package:Clone().Parent = Character
					end 		
				end
				if Character.Head.face.Texture == "rbxasset://textures/face.png" or Character.Head.face.Texture == "http://www.roblox.com/asset/?id=144080495 " then
					Character.Head.face.Texture = "http://www.roblox.com/asset/?id=20722053" 
				end 
			end 
		end

		--// Changes default shirt to alternatives
		if Character:FindFirstChild("Shirt") then
			if Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=398635080" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=34908815"	
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=398634294" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075290594"
			--// Pizza shirt 
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=382537084" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075360684"
			--// Guest Shirt 
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=607785311" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075383207"
			--// Motorcycle Jacket 
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=382538294" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=453443968"
			--// Voltron Shirt 
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=969769092" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075399056"
			--// Nerf Shirt
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=1032932317" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075404065"
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=382537700" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=50239378"
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=398633582" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075251501"
			elseif Character.Shirt.ShirtTemplate == "http://www.roblox.com/asset/?id=382538058" then
				Character.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1075319367"
			end 
		end

		--// Changes default pants to alternatives
		if Character:FindFirstChild("Pants") then
			--// Trousers
			if Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=129459076" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1077306000"
			--// Ragged Jeans
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=129458425" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=68642003"
			--// Shorts
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=382537568" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=51188779"
			--// Jeans + Green Converse
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=382538502" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1082074010"
			--// Ripped Jeans + Blue
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=398635336" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1082092794"
			--// Jeans + Boots
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=382537568" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=512629204"
			--// Shorts + Jandals
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=382537805" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=51189837"
			--// Techno Combo
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=398634487" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1084061038"
			--// Leggings + Sneakers
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=398633811" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=274766529"
			--// Dark Green Jeans
			elseif Character.Pants.PantsTemplate == "http://www.roblox.com/asset/?id=144076759" then
				Character.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1082074010"
			end	
		end

		--// Changes default faces to alternatives
		--// New smiley face
		if Character.Head.face.Texture == "http://www.roblox.com/asset/?id=144080495 " then
			Character.Head.face.Texture = "rbxasset://textures/face.png" 
		end
		--// Man face
		if Character.Head.face.Texture == "http://www.roblox.com/asset/?id=83017053" then
			Character.Head.face.Texture = "http://www.roblox.com/asset/?id=31123853" 
		--// Woman Face
		elseif Character.Head.face.Texture == "http://www.roblox.com/asset/?id=83022608" then
			Character.Head.face.Texture = "http://www.roblox.com/asset/?id=12145059" 
		end

		--// Changes head meshes back to default 
		--// Woman head
		if Character.Head.Mesh.MeshId == "http://www.roblox.com/asset/?id=82992952" then
			Character.Head.Mesh:Destroy()
			local Mesh = Instance.new("SpecialMesh")
			Mesh.Parent = Character.Head
			Mesh.Scale = Vector3.new(1.25,1.25,1.25) 
		--// Man head
		elseif Character.Head.Mesh.MeshId == "http://www.roblox.com/asset/?id=83001675" then
			local Mesh = Instance.new("SpecialMesh")
			Mesh.Parent = Character.Head
			Mesh.Scale = Vector3.new(1.25,1.25,1.25) 
		end

	end) 
end)












