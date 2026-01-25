--!strict

local Bynew: any = loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Bynew/refs/heads/main/ByModule.luau"))()
local Event: RemoteEvent = game:GetService("ReplicatedStorage").Events.RemoteEvent

local o; o = hookmetamethod(game, "__namecall", newcclosure(function(...: any): ...any
	local a: {any} = {...}
	if not checkcaller() and a[1] == Event and getnamecallmethod() == "FireServer" then
		for i: number = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o(...)
end))

local o2; o2 = hookfunction(Event.FireServer, newcclosure(function(...: any): ...any
	local a: {any} = {...}
	if not checkcaller() and a[1] == Event then
		for i: number = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o2(...)
end))

task.spawn(function(): ()
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"WalkSpeedInvalidRead", "WalkSpeedWriteHook"}
	})
	
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"JumpHeightInvalidRead", "JumpHeightWriteHook"}
	})
	
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"CFrameWriteHook", "CFrameChange", "FastTeleport"}
	})
	
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"NoClipNoTouch", "NoClipCanCollide"}
	})
	
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"BodyMover"}
	})
	
	Bynew.Hook({
		ScriptName = "BClient",
		Constants = {"ACF", "ACTrigger", "ACKickTrigger"}
	})
end)

task.wait(1)

Bynew.Hook({ScriptName = "BClient"}, function(f: any): ()
	local c: {any}? = nil
	pcall(function(): ()
		c = debug.getconstants(f)
	end)
	
	if not c then return end
	
	local noob: {string} = {
		"WalkSpeed", "JumpHeight", "CFrame", "NoClip", 
		"BodyMover", "Kick", "Ban", "ACF", "ACTrigger"
	}
	
	for i: number, const: any in c do
		if type(const) == "string" then
			for j: number, bad: string in noob do
				if const:find(bad) then
					debug.setconstant(f, 1, "")
					return
				end
			end
		end
	end
end)

warn("wait a second am i- su- superman?")
