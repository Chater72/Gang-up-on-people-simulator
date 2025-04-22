local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.BorderSizePixel = 0
title.Text = "Gang up on people simulator"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24

local tabsFrame = Instance.new("Frame")
tabsFrame.Parent = mainFrame
tabsFrame.Size = UDim2.new(1, 0, 0, 30)
tabsFrame.Position = UDim2.new(0, 0, 0, 50)
tabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabsFrame.BorderSizePixel = 0

local autoFarmTab = Instance.new("TextButton")
autoFarmTab.Parent = tabsFrame
autoFarmTab.Size = UDim2.new(0.5, 0, 1, 0)
autoFarmTab.Position = UDim2.new(0, 0, 0, 0)
autoFarmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoFarmTab.BorderSizePixel = 0
autoFarmTab.Text = "Auto Farm"
autoFarmTab.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmTab.Font = Enum.Font.SourceSans
autoFarmTab.TextSize = 18

local teleportsTab = Instance.new("TextButton")
teleportsTab.Parent = tabsFrame
teleportsTab.Size = UDim2.new(0.5, 0, 1, 0)
teleportsTab.Position = UDim2.new(0.5, 0, 0, 0)
teleportsTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
teleportsTab.BorderSizePixel = 0
teleportsTab.Text = "Teleports"
teleportsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportsTab.Font = Enum.Font.SourceSans
teleportsTab.TextSize = 18

local autoFarmContent = Instance.new("Frame")
autoFarmContent.Parent = mainFrame
autoFarmContent.Size = UDim2.new(1, 0, 0, 120)
autoFarmContent.Position = UDim2.new(0, 0, 0, 80)
autoFarmContent.BackgroundTransparency = 1 -- Скрываем фон

local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Parent = autoFarmContent
autoFarmButton.Size = UDim2.new(1, -20, 0, 50)
autoFarmButton.Position = UDim2.new(0, 10, 0, 10)
autoFarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmButton.BorderSizePixel = 0
autoFarmButton.Text = "Auto Farm!"
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.Font = Enum.Font.SourceSans
autoFarmButton.TextSize = 20

-- Логика автофарма
local farmingEnabled = false
getgenv().lol = false

local function toggleAutoFarm()
    farmingEnabled = not farmingEnabled
    getgenv().lol = farmingEnabled

    if farmingEnabled then
        autoFarmButton.Text = "Auto Farm Enabled!"
        task.spawn(function()
            while getgenv().lol do
                wait()
                for i, v in pairs(workspace.Particles:WaitForChild("Money"):GetChildren()) do
                    if v.Name == "Bundle" then
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame
                    end
                end
            end
        end)
    else
        autoFarmButton.Text = "Auto Farm Offed!"
        wait(2)
        autoFarmButton.Text = "Auto Farm!"
    end
end

autoFarmButton.MouseButton1Click:Connect(toggleAutoFarm)

local teleportsContent = Instance.new("Frame")
teleportsContent.Parent = mainFrame
teleportsContent.Size = UDim2.new(1, 0, 0, 120)
teleportsContent.Position = UDim2.new(0, 0, 0, 80)
teleportsContent.BackgroundTransparency = 1 -- Скрываем фон
teleportsContent.Visible = false -- Скрываем вкладку по умолчанию

local atmTeleportButton = Instance.new("TextButton")
atmTeleportButton.Parent = teleportsContent
atmTeleportButton.Size = UDim2.new(1, -20, 0, 30)
atmTeleportButton.Position = UDim2.new(0, 10, 0, 10)
atmTeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
atmTeleportButton.BorderSizePixel = 0
atmTeleportButton.Text = "Телепорт к банкомату"
atmTeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
atmTeleportButton.Font = Enum.Font.SourceSans
atmTeleportButton.TextSize = 16

atmTeleportButton.MouseButton1Click:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(-31.79524612426758, 3.053025245666504, 43.0905876159668)
        end
    end
end)

local spawnTeleportButton = Instance.new("TextButton")
spawnTeleportButton.Parent = teleportsContent
spawnTeleportButton.Size = UDim2.new(1, -20, 0, 30)
spawnTeleportButton.Position = UDim2.new(0, 10, 0, 50)
spawnTeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
spawnTeleportButton.BorderSizePixel = 0
spawnTeleportButton.Text = "Телепорт к дробовику"
spawnTeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnTeleportButton.Font = Enum.Font.SourceSans
spawnTeleportButton.TextSize = 16

spawnTeleportButton.MouseButton1Click:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new( -102.44718170166016, 3.748023271560669, 113.31853485107422) -- Установите координаты для спавна
        end
    end
end)

local pistolTeleportButton = Instance.new("TextButton")
pistolTeleportButton.Parent = teleportsContent
pistolTeleportButton.Size = UDim2.new(1, -20, 0, 30)
pistolTeleportButton.Position = UDim2.new(0, 10, 0, 90)
pistolTeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
pistolTeleportButton.BorderSizePixel = 0
pistolTeleportButton.Text = "Телепорт к пистолету"
pistolTeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
pistolTeleportButton.Font = Enum.Font.SourceSans
pistolTeleportButton.TextSize = 16

pistolTeleportButton.MouseButton1Click:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(16.948793411254883, 2.9980251789093018, -40.67388916015625)
        end
    end
end)

autoFarmTab.MouseButton1Click:Connect(function()
    autoFarmContent.Visible = true
    teleportsContent.Visible = false
    autoFarmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    teleportsTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

teleportsTab.MouseButton1Click:Connect(function()
    autoFarmContent.Visible = false
    teleportsContent.Visible = true
    autoFarmTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    teleportsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)
