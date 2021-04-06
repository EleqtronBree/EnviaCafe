--[[
Author(s): Electra Bree
Created in 2017

This script manages the music playlist and plays music in the game
The script is made with an open source custom Trello API, which is not given here
]]--

--// Variables
AP = require(1228758661)
BoardID = AP:GetBoardID("Envia | Admin Control")
ListID = AP:GetListID("Current Music",BoardID)
Cards = AP:GetCardsInList(ListID)
Songs = {}

for _,Content in pairs (Cards) do
	table.insert(Songs, Content)
end

--// Chooses a random song in the music playlist and loads the info into the UI
function playlistchoose()
	local Chosen = math.random(1,#Cards)
	for _,players in pairs (game.Players:GetChildren()) do
		players.PlayerGui.MusicGui.Frame.Song.Text = (Songs[Chosen]).name
		players.PlayerGui.MusicGui.Frame.Chooser.Text = string.upper("Chosen By The Envia Playlist")
	end
	game.Workspace.Sound.SoundId = "rbxassetid://"..(Songs[Chosen]).desc
end

--// Chooses a song from the request queue
function selectchoose()
	local Chosen = math.random(1,#ChosenSongs)
	for _,players in pairs (game.Players:GetChildren()) do
		players.PlayerGui.MusicGui.Frame.Song.Text = (ChosenSongs[Chosen]).Name
		players.PlayerGui.MusicGui.Frame.Chooser.Text = string.upper("Chosen By "..(ChosenSongs[Chosen]).Identifier.Value)
	end
	game.StarterGui.MusicGui.Frame.Song.Text = (ChosenSongs[Chosen]).Name
	game.StarterGui.MusicGui.Frame.Chooser.Text = string.upper("Chosen By "..(ChosenSongs[Chosen]).Identifier.Value)
	game.Workspace.Sound.SoundId = "rbxassetid://"..(ChosenSongs[Chosen]).Value
	script.Custom:FindFirstChild(ChosenSongs[Chosen].Name):Destroy()
end

while true do
	ChosenSongs = {}	
	for _,Stuff in pairs (script.Custom:GetChildren()) do
		table.insert(ChosenSongs, Stuff)
	end
	if #ChosenSongs == 0 then
		playlistchoose()
	else
		selectchoose()
	end
	game.Workspace.Sound:Play()
	repeat 
		wait() 
	until 
		game.Workspace.Sound.TimeLength > 0
	wait(game.Workspace.Sound.TimeLength)
end
