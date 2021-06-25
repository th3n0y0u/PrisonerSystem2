local function mainclass()
	
	local jail = script.Parent.Jailed
	local release = script.Parent.Released
	
	local function released()
		wait(1)
		release:FireServer(script.Parent.TimeSentenced.Text)
	end

	local function jailed()
		jail:FireServer(script.Parent.JailPlayer.Text, script.Parent.TimeSentenced.Text)
		released()
	end

	script.Parent.TimeSentenced.FocusLost:Connect(jailed)
end

mainclass() 
