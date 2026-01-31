local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = game:GetService(n)
		return s[n]
	end
})

local Remote = GetService.ReplicatedStorage.Remote

local o; o = hookmetamethod(game, "__namecall", newcclosure(function(...)
	local a = {...}
	if not checkcaller() and a[1] == Remote and getnamecallmethod() == "FireServer" and a[2] == "YxRYK" then
		return
	end
	return o(...)
end))

local o2; o2 = hookfunction(Remote.FireServer, newcclosure(function(...)
	local a = {...}
	if not checkcaller() and a[1] == Remote and a[2] == "YxRYK" then
		return
	end
	return o2(...)
end))
