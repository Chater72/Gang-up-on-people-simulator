local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
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

local button = Instance.new("TextButton")
button.Parent = mainFrame
button.Size = UDim2.new(1, 0, 0, 50)
button.Position = UDim2.new(0, 0, 0, 50)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.BorderSizePixel = 0
button.Text = "Auto Farm!"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSans
button.TextSize = 20

local farmingEnabled = false
getgenv().lol = false

local function toggleAutoFarm()
    farmingEnabled = not farmingEnabled
    getgenv().lol = farmingEnabled

    if farmingEnabled then
        button.Text = "Auto Farm Enabled!"
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
        button.Text = "Auto Farm Offed!"
        wait(2)
		button.Text = "Auto Farm!"
    end
end

button.MouseButton1Click:Connect(toggleAutoFarm)

local footer = Instance.new("TextLabel")
footer.Parent = mainFrame
footer.Size = UDim2.new(1, 0, 0, 50)
footer.Position = UDim2.new(0, 0, 0, 100)
footer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
footer.BorderSizePixel = 0
footer.Text = "t.me/tolik_scripter"
footer.TextColor3 = Color3.fromRGB(255, 255, 255)
footer.Font = Enum.Font.SourceSans
footer.TextSize = 16
footer.TextTransparency = 0.5
