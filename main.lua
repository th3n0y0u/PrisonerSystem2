local function mainclass()

	function released()
		local target = game.Players:FindFirstChild(tostring(script.Parent.JailPlayer.Text))
		if target ~= nil then
			wait(target.Character.Time.Value)
			target.Character.Time.Value = 0
			target.TeamColor = BrickColor.new("New Yeller")
		else
			print("invalid")
		end
	end

	function jailed()
		local target = game.Players:FindFirstChild(tostring(script.Parent.JailPlayer.Text))
		if target ~= nil then
			local Time = tonumber(script.Parent.TimeSentenced.Text)
			target.Character.Time.Value = Time
			target.TeamColor = BrickColor.new("Maroon")
			if target.Backpack:GetChildren() then
				for _,v in pairs(target.Backpack:GetChildren()) do
					local child = target.Backpack:FindFirstChild(tostring(v))
					child:Destroy()
				end
			end
			target.Character:BreakJoints()
			released()
		else
			print("invalid")
		end
	end

	script.Parent.TimeSentenced.FocusLost:Connect(jailed)
end

mainclass() 