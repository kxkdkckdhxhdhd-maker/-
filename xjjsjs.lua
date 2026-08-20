-- // VelocityHub By Squez3 v2 // --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

_G.VelocityHub = {
    ESP = false,
    Hitbox = false,
    HitboxSize = 3,
    NoRecoil = false,
    FOVPlayer = false,
    FOVValue = 70,
    ThirdPerson = false,
    TPDistance = 10,
    NightMode = false,
    Snow = false,
    FullBright = false,
    TransparentArms = false,
    LiteOptimization = false,
    MaxOptimization = false
}

local PlayerGui
repeat
    PlayerGui = LP:FindFirstChild("PlayerGui")
    task.wait(0.1)
until PlayerGui

if PlayerGui:FindFirstChild("VelocityHub") then
    PlayerGui.VelocityHub:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "VelocityHub"
Gui.Parent = PlayerGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Кнопка открытия (сверху)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = Gui
OpenBtn.Size = UDim2.new(0, 40, 0, 30)
OpenBtn.Position = UDim2.new(0, 10, 0, 10)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
OpenBtn.Text = "+"
OpenBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
OpenBtn.Font = Enum.Font.GothamBlack
OpenBtn.TextSize = 18
OpenBtn.Visible = false
OpenBtn.ZIndex = 1000
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 6)

-- Main
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Size = UDim2.new(0, 550, 0, 370)
Main.Position = UDim2.new(0.5, -275, 0.5, -185)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
Main.Visible = true
Main.Active = true
Main.Draggable = true
Main.ZIndex = 999
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Border = Instance.new("UIStroke")
Border.Parent = Main
Border.Color = Color3.fromRGB(50, 50, 58)
Border.Thickness = 1

-- Header Bar
local HeaderBar = Instance.new("Frame")
HeaderBar.Parent = Main
HeaderBar.Size = UDim2.new(1, 0, 0, 35)
HeaderBar.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
Instance.new("UICorner", HeaderBar).CornerRadius = UDim.new(0, 8)

local Logo = Instance.new("TextLabel")
Logo.Parent = HeaderBar
Logo.Size = UDim2.new(0, 150, 1, 0)
Logo.Position = UDim2.new(0, 15, 0, 0)
Logo.BackgroundTransparency = 1
Logo.Text = "VelocityHub"
Logo.TextColor3 = Color3.fromRGB(220, 220, 230)
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 14
Logo.TextXAlignment = Enum.TextXAlignment.Left

local SubLogo = Instance.new("TextLabel")
SubLogo.Parent = HeaderBar
SubLogo.Size = UDim2.new(0, 80, 1, 0)
SubLogo.Position = UDim2.new(0, 150, 0, 0)
SubLogo.BackgroundTransparency = 1
SubLogo.Text = "By Squez3"
SubLogo.TextColor3 = Color3.fromRGB(100, 100, 110)
SubLogo.Font = Enum.Font.Gotham
SubLogo.TextSize = 9
SubLogo.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка сворачивания (минус)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = HeaderBar
MinimizeBtn.Size = UDim2.new(0, 35, 0, 25)
MinimizeBtn.Position = UDim2.new(1, -45, 0.5, -12)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
MinimizeBtn.Font = Enum.Font.GothamBlack
MinimizeBtn.TextSize = 14
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 5)

MinimizeBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenBtn.Visible = false
end)

-- Left Navigation
local Nav = Instance.new("Frame")
Nav.Parent = Main
Nav.Size = UDim2.new(0, 140, 1, -35)
Nav.Position = UDim2.new(0, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
Instance.new("UICorner", Nav).CornerRadius = UDim.new(0, 8)

local NavLayout = Instance.new("UIListLayout")
NavLayout.Parent = Nav
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavLayout.Padding = UDim.new(0, 2)

local Pages = {}
local NavButtons = {}

local function CreateTab(name, icon, order)
    local btn = Instance.new("TextButton")
    btn.Parent = Nav
    btn.Size = UDim2.new(1, -20, 0, 32)
    btn.BackgroundTransparency = 1
    btn.Text = "  " .. icon .. "  " .. name
    btn.TextColor3 = Color3.fromRGB(130, 130, 140)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local page = Instance.new("ScrollingFrame")
    page.Parent = Main
    page.Size = UDim2.new(1, -150, 1, -45)
    page.Position = UDim2.new(0, 145, 0, 42)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = page
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    
    Pages[name] = page
    NavButtons[name] = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        page.Visible = true
        for _, b in pairs(NavButtons) do
            b.TextColor3 = Color3.fromRGB(130, 130, 140)
        end
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    return page
end

local Visuals = CreateTab("Visuals", "◈", 1)
local Combat = CreateTab("Combat", "◉", 2)
local Effects = CreateTab("Effects", "◇", 3)
local Config = CreateTab("Config", "▣", 4)

Pages["Visuals"].Visible = true
NavButtons["Visuals"].TextColor3 = Color3.fromRGB(255, 255, 255)

-- Элементы
local function AddToggle(page, text, key)
    local c = Instance.new("Frame")
    c.Parent = page
    c.Size = UDim2.new(0.95, 0, 0, 35)
    c.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    
    local btn = Instance.new("TextButton")
    btn.Parent = c
    btn.Size = UDim2.new(1, -55, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Position = UDim2.new(0, 12, 0, 0)
    
    local toggle = Instance.new("Frame")
    toggle.Parent = c
    toggle.Size = UDim2.new(0, 38, 0, 19)
    toggle.Position = UDim2.new(1, -48, 0.5, -9)
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)
    
    local dot = Instance.new("Frame")
    dot.Parent = toggle
    dot.Size = UDim2.new(0, 15, 0, 15)
    dot.Position = UDim2.new(0, 2, 0.5, -7)
    dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    
    if _G.VelocityHub[key] then
        toggle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
        dot.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        dot.Position = UDim2.new(1, -17, 0.5, -7)
    end
    
    btn.MouseButton1Click:Connect(function()
        _G.VelocityHub[key] = not _G.VelocityHub[key]
        if _G.VelocityHub[key] then
            toggle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            dot.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            dot.Position = UDim2.new(1, -17, 0.5, -7)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
            dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            dot.Position = UDim2.new(0, 2, 0.5, -7)
        end
    end)
end

local function AddSlider(page, text, key, min, max)
    local c = Instance.new("Frame")
    c.Parent = page
    c.Size = UDim2.new(0.95, 0, 0, 50)
    c.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel")
    label.Parent = c
    label.Size = UDim2.new(1, -70, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 3)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.Font = Enum.Font.Gotham
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = c
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -58, 0, 3)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(_G.VelocityHub[key])
    valueLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextSize = 11
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local minus = Instance.new("TextButton")
    minus.Parent = c
    minus.Size = UDim2.new(0, 30, 0, 20)
    minus.Position = UDim2.new(0, 12, 0, 27)
    minus.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    minus.Text = "-"
    minus.TextColor3 = Color3.fromRGB(180, 180, 190)
    minus.TextSize = 13
    Instance.new("UICorner", minus).CornerRadius = UDim.new(0, 4)
    
    local plus = Instance.new("TextButton")
    plus.Parent = c
    plus.Size = UDim2.new(0, 30, 0, 20)
    plus.Position = UDim2.new(0, 48, 0, 27)
    plus.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(180, 180, 190)
    plus.TextSize = 13
    Instance.new("UICorner", plus).CornerRadius = UDim.new(0, 4)
    
    -- Полоса
    local bar = Instance.new("Frame")
    bar.Parent = c
    bar.Size = UDim2.new(1, -100, 0, 4)
    bar.Position = UDim2.new(0, 88, 0, 35)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame")
    fill.Parent = bar
    fill.Size = UDim2.new((_G.VelocityHub[key] - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    local function update()
        valueLabel.Text = tostring(_G.VelocityHub[key])
        fill.Size = UDim2.new((_G.VelocityHub[key] - min) / (max - min), 0, 1, 0)
    end
    
    minus.MouseButton1Click:Connect(function()
        if _G.VelocityHub[key] > min then
            _G.VelocityHub[key] = _G.VelocityHub[key] - 1
            update()
        end
    end)
    
    plus.MouseButton1Click:Connect(function()
        if _G.VelocityHub[key] < max then
            _G.VelocityHub[key] = _G.VelocityHub[key] + 1
            update()
        end
    end)
end

-- Visuals
AddToggle(Visuals, "ESP", "ESP")
AddToggle(Visuals, "Third Person", "ThirdPerson")
AddSlider(Visuals, "TP Distance", "TPDistance", 5, 25)
AddToggle(Visuals, "FOV Player", "FOVPlayer")
AddSlider(Visuals, "FOV Value", "FOVValue", 30, 120)
AddToggle(Visuals, "Transparent Arms", "TransparentArms")

-- Combat
AddToggle(Combat, "Hitbox", "Hitbox")
AddSlider(Combat, "Hitbox Size", "HitboxSize", 1, 16)
AddToggle(Combat, "No Recoil", "NoRecoil")

-- Effects
AddToggle(Effects, "Night Mode", "NightMode")
AddToggle(Effects, "Full Bright", "FullBright")
AddToggle(Effects, "Snow", "Snow")

-- Config
AddToggle(Config, "Lite Optimization", "LiteOptimization")
AddToggle(Config, "Max Optimization", "MaxOptimization")

-- [ESP]
local function CreateESP(player)
    if player == LP or not player.Character then return end
    if player.Character:FindFirstChild("RedESP") then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "RedESP"
    highlight.Parent = player.Character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

local function RemoveESP()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local hl = p.Character:FindFirstChild("RedESP")
            if hl then hl:Destroy() end
        end
    end
end

-- [SNOW]
local SnowParts = {}
local function CreateSnow()
    if #SnowParts > 0 then return end
    local base = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.HumanoidRootPart.Position or Vector3.new(0, 0, 0)
    for x = -2, 2 do
        for z = -2, 2 do
            local part = Instance.new("Part")
            part.Parent = workspace
            part.Size = Vector3.new(60, 1, 60)
            part.Position = Vector3.new(base.X + x * 60, base.Y + 50, base.Z + z * 60)
            part.Transparency = 1
            part.Anchored = true
            part.CanCollide = false
            local em = Instance.new("ParticleEmitter")
            em.Parent = part
            em.Rate = 25
            em.Lifetime = NumberRange.new(30)
            em.Speed = NumberRange.new(2)
            em.VelocitySpread = 250
            em.SpreadAngle = Vector2.new(180, 180)
            em.Size = NumberSequence.new(1)
            em.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
            em.Acceleration = Vector3.new(0, -2, 0)
            em.Drag = 0.1
            em.LockedToPart = false
            em.Enabled = true
            table.insert(SnowParts, part)
        end
    end
end

local function RemoveSnow()
    for _, part in pairs(SnowParts) do part:Destroy() end
    SnowParts = {}
end

-- [OPTIMIZATION]
local OriginalData = {}
local function ApplyLite()
    Lighting.GlobalShadows = _G.VelocityHub.LiteOptimization and false or true
    Lighting.FogEnd = _G.VelocityHub.LiteOptimization and 300 or 100000
end

local function ApplyMax()
    if _G.VelocityHub.MaxOptimization then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 30
        Lighting.Brightness = 1
        Lighting.Outlines = false
        workspace.Terrain.WaterWaveSize = 0
        workspace.Terrain.WaterWaveSpeed = 0
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                if not OriginalData[v] then
                    OriginalData[v] = {Material = v.Material, CastShadow = v.CastShadow}
                end
                v.Material = Enum.Material.SmoothPlastic
                v.CastShadow = false
                v.Reflectance = 0
            end
            if v:IsA("Texture") or v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    else
        for v, data in pairs(OriginalData) do
            if v and v.Parent then
                v.Material = data.Material
                v.CastShadow = data.CastShadow
            end
        end
        OriginalData = {}
    end
end

-- [RENDER]
RunService.RenderStepped:Connect(function()
    pcall(function()
        if _G.VelocityHub.ESP then
            for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
        else
            RemoveESP()
        end
        
        if _G.VelocityHub.FOVPlayer then
            Camera.FieldOfView = _G.VelocityHub.FOVValue
        else
            Camera.FieldOfView = 70
        end
        
        if _G.VelocityHub.ThirdPerson then
            LP.CameraMode = Enum.CameraMode.Classic
            LP.CameraMaxZoomDistance = _G.VelocityHub.TPDistance
            LP.CameraMinZoomDistance = 0.5
        end
        
        if LP.Character then
            for _, part in pairs(LP.Character:GetChildren()) do
                if part:IsA("BasePart") and (part.Name == "Left Arm" or part.Name == "Right Arm") then
                    part.Transparency = _G.VelocityHub.TransparentArms and 0.7 or 0
                end
            end
        end
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                if _G.VelocityHub.Hitbox then
                    head.Size = Vector3.new(_G.VelocityHub.HitboxSize, _G.VelocityHub.HitboxSize, _G.VelocityHub.HitboxSize)
                    head.Transparency = 0.4
                    head.CanCollide = false
                    head.Material = Enum.Material.Neon
                    head.Color = Color3.fromRGB(0, 150, 255)
                else
                    head.Size = Vector3.new(2, 1, 1)
                    head.Transparency = 0
                    head.Material = Enum.Material.SmoothPlastic
                end
            end
        end
        
        if _G.VelocityHub.NightMode then
            Lighting.ClockTime = 0
            Lighting.Brightness = 0.1
        elseif _G.VelocityHub.FullBright then
            Lighting.ClockTime = 14
            Lighting.Brightness = 5
        else
            Lighting.ClockTime = 14
            Lighting.Brightness = 2
        end
    end)
end)

task.spawn(function() while true do ApplyLite() ApplyMax() task.wait(1) end end)
task.spawn(function() while true do task.wait(0.5) if _G.VelocityHub.Snow then CreateSnow() else RemoveSnow() end end end)
task.spawn(function() while true do task.wait(0.1) if _G.VelocityHub.NoRecoil then pcall(function() local tool = LP.Character and LP.Character:FindFirstChildWhichIsA("Tool") if tool then for _, v in pairs(tool:GetDescendants()) do if v:IsA("NumberValue") and string.find(string.lower(v.Name), "recoil") then v.Value = 0 end end end end) end end end)
