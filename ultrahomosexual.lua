game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "lgbtq is a mental illness", -- Required
	Text = "buy kiriothub", -- Required
	Icon = "rbxassetid://1234567890" -- Optional
})


--made by kalas#1330 dont dm otherwise ill eat your ass
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Toggled = false
local Keybind = "f" --keybind


Mouse.KeyDown:Connect(function(Key)
if Key == Keybind then
if Toggled then
Toggled = false
else
Toggled = true
while task.wait() do
if Toggled == true then
pcall(function()
for i,v in pairs(workspace.Mobs:GetDescendants()) do
    if v:IsA("Model") then
        local ohInstance1 = v
        local ohVector32 = v.HumanoidRootPart.Position
        game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit:FireServer(ohInstance1, ohVector32)
        if v.Humanoid.Health == 0 then v:Destroy() end
        if v == nil or Toggled == false then break end
    end
end
end)
end
end
end
end
end)


