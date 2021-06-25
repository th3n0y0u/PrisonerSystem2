local function mainclass()
	
	local players = game:GetService("Players")
	local jail = script.Parent.Jailed
	local release = script.Parent.Released
	
	local function released(player, text)
		local target = players:FindFirstChild(text)
		if target ~= nil then
			wait(target.Character.Time.Value)
			target.Character.Time.Value = 0
			target.TeamColor = BrickColor.new("New Yeller")
		else
			print("invalid")
		end
	end
	
	local function jailed(player, text, timesentenced)
		local target = players:FindFirstChild(text)
		if target ~= nil then
			target.TeamColor = BrickColor.new("Maroon")
			target.Character.Time.Value = tonumber(timesentenced)
			if target.Backpack:GetChildren() then
				for i, v in pairs(target.Backpack:GetChildren()) do
					local child = target.Backpack:FindFirstChild(tostring(v))
					child:Destroy()
				end
			end
			target.Character:BreakJoints()
			release.OnServerEvent:Connect(released)
		else
			print("invalid")
		end
	end
	
	jail.OnServerEvent:Connect(jailed)
end

mainclass()
