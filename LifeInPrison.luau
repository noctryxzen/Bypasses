--!strict

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

for i: number, v: any in getgc(false) do
	if type(v) == "function" and islclosure(v) and not isexecutorclosure(v) then
		local info: {[string]: any} = debug.getinfo(v)
		if info.source and info.source:find("BClient") then
			local c: {any}? = nil
			pcall(function(): ()
				c = debug.getconstants(v)
			end)
			
			if c then
				local kill: boolean = false
				for j: number, const: any in c do
					if type(const) == "string" then
						if const:find("WalkSpeed") or const:find("JumpHeight") or const:find("CFrame") or 
						   const:find("NoClip") or const:find("BodyMover") or const:find("ACF") then
							kill = true
							break
						end
					end
				end
				
				if kill then
					for j: number = 1, #c do
						pcall(function(): ()
							debug.setconstant(v, j, nil)
						end)
					end
					
					pcall(function(): ()
						local u: {[any]: any} = debug.getupvalues(v)
						for k: any, val: any in u do
							pcall(function(): ()
								debug.setupvalue(v, 1, nil)
							end)
						end
					end)
					
					pcall(function(): ()
						local p: {any} = debug.getprotos(v)
						for j: number, proto: any in p do
							pcall(function(): ()
								hookfunction(proto, function(): () end)
							end)
						end
					end)
				end
			end
		end
	end
end

warn("wait a second.. am i su- superman??")
