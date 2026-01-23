local clonegetserv: (any, string) -> any = clonefunction and clonefunction(game.GetService) or game.GetService
local cloneref: (any) -> any = cloneref and (clonefunction and clonefunction(cloneref) or cloneref) or function(x: any): any return x end

local servs: any = setmetatable({}, {
	__index = function(s: any, n: any): any
		s[n] = cloneref(clonegetserv(game, n))
		return s[n]
	end
})

if not servs.GuiService.ErrorMessageChanged then
	return
end

local notified: boolean = false

servs.GuiService.ErrorMessageChanged:Connect(function(): ()
	servs.GuiService:ClearError()
	if not notified then
		servs.StarterGui:SetCore("SendNotification", {
			Title = "Clearer",
			Text = "Kick UI Cleared",
			Duration = 3
		})
		notified = true
	end
end)
