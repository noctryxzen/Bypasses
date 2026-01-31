local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = game:GetService(n)
		return s[n]
	end
})

local Event = GetService.ReplicatedStorage.Events.RemoteEvent

local o; o = hookmetamethod(game, "__namecall", newcclosure(function(...)
	local a = {...}
	if not checkcaller() and a[1] == Event and getnamecallmethod() == "FireServer" then
		for i = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o(...)
end))

local o2; o2 = hookfunction(Event.FireServer, newcclosure(function(...)
	local a = {...}
	if not checkcaller() and a[1] == Event then
		for i = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o2(...)
end))

warn("im s- i will say it but lemme listen for ac first.")

for i, v in getgc(false) do
	if type(v) == "function" and islclosure(v) and not isexecutorclosure(v) then
		local Success, Constants = pcall(debug.getconstants, v)
		
		if Success and Constants then
			for j, Constant in Constants do
				if type(Constant) == "string" and Constant == "ACTrigger" then
					local Info = debug.getinfo(v)
					if Info.source and Info.source:find("BClient") then
						pcall(debug.setconstant, v, j, "lol who made this ac ima cry")
						break
					end
				end
			end
		end
	end
end

warn("ok")
