if not game:IsLoaded() then
game.Loaded:Wait()
end
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("virgin simulator") -- Creates the window
local b = w:CreateFolder("Main") -- Creates the folder(U will put here your buttons,etc)
local c = w:CreateFolder("Misc/Info") -- Creates the folder(U will put here your buttons,etc)

c:Label("Sadly the furry dev added raycast hitboxes, luckily the script he added is open source so i can figure out a workaround",{
    TextSize = 10; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

c:Label("inf money works with playtime rewards, you gotta have at least 1 claimed",{
    TextSize = 12; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

c:Label("i will add gamepasses and no dmg cooldown once i find the time to do so",{
    TextSize = 13; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 


local eggs = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
    table.insert(eggs, v.Name)
end


b:Toggle("Auto farm",function(bool)
        getgenv().autoFarm = bool
        if bool then
            attack()
        end
end)

b:Toggle("Inf Money",function(bool)
        getgenv().abuser = bool
        if bool then
            abuse()
        end
end)

b:Toggle("Hatch Egg",function(bool)
    getgenv().hatch = bool
    if bool then
        hatchYes()
    end
end)

local selectedEgg
b:Dropdown("Select Egg",eggs,true,function(value) --true/false, replaces the current title "Dropdown" with the option that t
    selectedEgg = value
end)

game.Players.LocalPlayer.PlayerGui.CoinEffects.Enabled = false

--made by kalas#1330 dont dm otherwise ill eat your ass

function attack()
        spawn(function()
        while task.wait() do
        if not getgenv().autoFarm then break end
        pcall(function()
            for _,v in pairs(workspace.Mobs:GetChildren()) do
                if v:IsA("Folder") then
                    for _,v2 in pairs(v:GetChildren()) do
                        if v2:FindFirstChild("Humanoid") then
                            if v2.Humanoid.Health > 0 then
                                    repeat
                                    task.wait()
                                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame + Vector3.new(0,-8,0)
                                    local ohInstance1 = v2
                                    local ohVector32 = v2.HumanoidRootPart.Position + Vector3.new(0,-5,0)
                                    game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit:FireServer(ohInstance1, ohVector32)
                                        until v2.Humanoid.Health <= 0 or getgenv().autoFarm == false break end
                                        if v2.Humanoid.Health == 0 then v2:Destroy()
                                        if getgenv().autoFarm == false then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,10,0)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end

function abuse()
        spawn(function()
        while task.wait() do
        if not getgenv().abuser then break end
        for i = 1, 10 do
            local args = i
            game:GetService("ReplicatedStorage").Events.GiveStayReward:FireServer(args)
            end
            end
        end)
    end

function hatchYes()
    spawn(function()
        while wait() do
            if not getgenv().hatch then break end
            local ohString1 = selectedEgg
            local ohString2 = "Hatch"
            local ohTable3 = {}
            game:GetService("ReplicatedStorage").Remotes.Gameplay.RequestPetPurchase:InvokeServer(ohString1, ohString2, ohTable3)
        end
    end)
end
