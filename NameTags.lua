--[[
Author(s): Electra Bree
Created in 2017

This script changes the color of name tags based on the rank and user
This script no longer works and should only be used for reference
]]--

script.Parent.ChildAdded:connect(function(Frame)
	repeat wait() until Frame:FindFirstChild("TextLabel")
	if string.match(Frame.TextLabel.TextButton.Text,"Cytronix") or string.match(Frame.TextLabel.TextButton.Text,"iMannyz") then
		local Rainbow = game.ServerScriptService['Commands']['Connect']:Clone()
		Rainbow.Parent = Frame.TextLabel
		Rainbow.Disabled = false 
	end 
end)