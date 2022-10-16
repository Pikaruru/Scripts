local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local window = ui.Load({
	Title = "Copy paste Clicker",
	Style = 3,

	SizeX = 400,
	SizeY = 400,

	Theme = "Dark",

	ColorOverrides = {
		MainFrame = Color3.fromRGB(10, 10, 10),
		NavBar = Color3.fromRGB(24, 24, 24),
		TitleBar = Color3.fromRGB(22, 22, 22),
		Content = Color3.fromRGB(50, 50, 50),
	},
})

local Client = game.Players.LocalPlayer
local RS = game.ReplicatedStorage
local Notifications = Client.PlayerGui.ScreenGui.Notifications

local Events = {
	Click = RS.Communication.Events.ClickDetect,
	Hatch = RS.Communication.Events.OpenCapsules,
	Rebirth = RS.Communication.Events.Rebirth,
	EquipBest = RS.Communication.Events.EquipBest,
}

local Settings = {
	AutoClick = false,
	AutoHatch = false,
	SelectedEgg = "Forest Egg",
	AutoEquip = false,
	AutoRebirth = false,
	SelectedRebirth = 1,
}

local Util = {}
do
	function Util.SetSetting(setting, value)
		Settings[setting] = value
	end
	function Util.GetEggs()
		local EggTable = {}
		for _, v in next, workspace.GameAssets.Capsules:GetChildren() do
			table.insert(EggTable, v.Name)
		end
		return EggTable
	end
end

local Functions = {}
do
	function Functions.Click()
		while true do
			task.wait()
			if Settings.AutoClick then
				Events.Click:FireServer()
			end
		end
	end
	function Functions.Hatch()
		while true do
			task.wait()
			if Settings.AutoHatch then
				Events.Hatch:FireServer(Settings.SelectedEgg, 1)
			end
		end
	end
	function Functions.Rebirth()
		while true do
			task.wait()
			if Settings.AutoRebirth then
				Events.Rebirth:FireServer(Settings.SelectedRebirth)
			end
		end
	end
	function Functions.Equip()
		while true do
			task.wait()
			if Settings.AutoEquip then
				Events.EquipBest:FireServer()
			end
		end
	end
end

local Tabs = {}

Tabs.Autofarm = window.New({ Title = "Autofarm" })
do
	Tabs.Autofarm.Toggle({
		Text = "Auto Click",
		Callback = function(Value)
			Util.SetSetting("AutoClick", Value)
		end,
	})
	Tabs.Autofarm.Toggle({
		Text = "Auto Hatch",
		Callback = function(Value)
			Util.SetSetting("AutoHatch", Value)
		end,
	})
	Tabs.Autofarm.Dropdown({
		Text = "Select Egg",
		Options = Util.GetEggs(),
		Callback = function(Value)
			Util.SetSetting("SelectedEgg", Value)
		end,
	})
	Tabs.Autofarm.Toggle({
		Text = "Auto Equip",
		Callback = function(Value)
			Util.SetSetting("AutoEquip", Value)
		end,
	})
	Tabs.Autofarm.Toggle({
		Text = "Auto Rebirth",
		Callback = function(Value)
			Util.SetSetting("AutoRebirth", Value)
		end,
	})
	Tabs.Autofarm.TextField({
		Text = "Rebirth Amount",
		Callback = function(Value)
			Util.SetSetting("SelectedRebirth", tonumber(Value))
		end,
	})
	Tabs.Autofarm.Toggle({
		Text = "Hide Notifications",
		Callback = function(Value)
			Notifications.Visible = not Value
		end,
	})
end

for _, v in next, Functions do
	task.spawn(v)
end
