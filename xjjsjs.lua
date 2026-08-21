local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

_G.VH = {
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
    SnowAmount = 3,
    FullBright = false,
    TransparentArms = false,
    BulletTracers = false,
    LiteOptimization = false,
    MaxOptimization = false
}

local ValidKeys = {
    ["SQU-EZ3-HUB"] = 999
}

local PlayerGui = LP:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("VH") then
    PlayerGui.VH:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "VH"
Gui.Parent = PlayerGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- KEY SCREEN
local KeyScreen = Instance.new("Frame")
KeyScreen.Parent = Gui
KeyScreen.Size = UDim2.new(0, 380, 0, 280)
KeyScreen.Position = UDim2.new(0.5, -190, 0.5, -140)
KeyScreen.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
KeyScreen.Visible = true
KeyScreen.Active = true
KeyScreen.Draggable = true
KeyScreen.ZIndex = 1000
Instance.new("UICorner", KeyScreen).CornerRadius = UDim.new(0, 10)

local KHeader = Instance.new("Frame")
KHeader.Parent = KeyScreen
KHeader.Size = UDim2.new(1, 0, 0, 40)
KHeader.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Instance.new("UICorner", KHeader).CornerRadius = UDim.new(0, 10)

local KLogo = Instance.new("TextLabel")
KLogo.Parent = KHeader
KLogo.Size = UDim2.new(1, -20, 1, 0)
KLogo.Position = UDim2.new(0, 15, 0, 0)
KLogo.BackgroundTransparency = 1
KLogo.Text = "VelocityHub"
KLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
KLogo.Font = Enum.Font.GothamBlack
KLogo.TextSize = 16
KLogo.TextXAlignment = Enum.TextXAlignment.Left

local NickLabel = Instance.new("TextLabel")
NickLabel.Parent = KeyScreen
NickLabel.Size = UDim2.new(1, -30, 0, 20)
NickLabel.Position = UDim2.new(0, 15, 0, 50)
NickLabel.BackgroundTransparency = 1
NickLabel.Text = "Ваш Никнейм:"
NickLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
NickLabel.Font = Enum.Font.Gotham
NickLabel.TextSize = 12
NickLabel.TextXAlignment = Enum.TextXAlignment.Left

local NickInput = Instance.new("TextBox")
NickInput.Parent = KeyScreen
NickInput.Size = UDim2.new(1, -30, 0, 35)
NickInput.Position = UDim2.new(0, 15, 0, 72)
NickInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
NickInput.PlaceholderText = "Nickname"
NickInput.Text = ""
NickInput.TextColor3 = Color3.fromRGB(255, 255, 255)
NickInput.Font = Enum.Font.Gotham
NickInput.TextSize = 14
NickInput.TextXAlignment = Enum.TextXAlignment.Center
Instance.new("UICorner", NickInput).CornerRadius = UDim.new(0, 6)

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Parent = KeyScreen
KeyLabel.Size = UDim2.new(1, -30, 0, 20)
KeyLabel.Position = UDim2.new(0, 15, 0, 112)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "Ваш Ключ:"
KeyLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
KeyLabel.Font = Enum.Font.Gotham
KeyLabel.TextSize = 12
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyScreen
KeyInput.Size = UDim2.new(1, -30, 0, 35)
KeyInput.Position = UDim2.new(0, 15, 0, 134)
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
KeyInput.PlaceholderText = "XXX-XXX-XXX"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamBold
KeyInput.TextSize = 14
KeyInput.TextXAlignment = Enum.TextXAlignment.Center
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)

local KStatus = Instance.new("TextLabel")
KStatus.Parent = KeyScreen
KStatus.Size = UDim2.new(1, -30, 0, 20)
KStatus.Position = UDim2.new(0, 15, 0, 175)
KStatus.BackgroundTransparency = 1
KStatus.Text = ""
KStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
KStatus.Font = Enum.Font.Gotham
KStatus.TextSize = 11
KStatus.TextXAlignment = Enum.TextXAlignment.Center

local KBtn = Instance.new("TextButton")
KBtn.Parent = KeyScreen
KBtn.Size = UDim2.new(1, -30, 0, 40)
KBtn.Position = UDim2.new(0, 15, 0, 200)
KBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 68)
KBtn.Text = "АКТИВИРОВАТЬ"
KBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
KBtn.Font = Enum.Font.GothamBold
KBtn.TextSize = 14
Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 6)

-- SELECT SCREEN
local SelectScreen = Instance.new("Frame")
SelectScreen.Parent = Gui
SelectScreen.Size = UDim2.new(0, 280, 0, 200)
SelectScreen.Position = UDim2.new(0.5, -140, 0.5, -100)
SelectScreen.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
SelectScreen.Visible = false
SelectScreen.Active = true
SelectScreen.Draggable = true
SelectScreen.ZIndex = 999
Instance.new("UICorner", SelectScreen).CornerRadius = UDim.new(0, 10)

local SHeader = Instance.new("Frame")
SHeader.Parent = SelectScreen
SHeader.Size = UDim2.new(1, 0, 0, 40)
SHeader.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
Instance.new("UICorner", SHeader).CornerRadius = UDim.new(0, 10)

local SLogo = Instance.new("TextLabel")
SLogo.Parent = SHeader
SLogo.Size = UDim2.new(1, 0, 1, 0)
SLogo.BackgroundTransparency = 1
SLogo.Text = "VelocityHub"
SLogo.TextColor3 = Color3.fromRGB(220, 220, 230)
SLogo.Font = Enum.Font.GothamBlack
SLogo.TextSize = 15

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Parent = SelectScreen
WelcomeText.Size = UDim2.new(1, -30, 0, 30)
WelcomeText.Position = UDim2.new(0, 15, 0, 45)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Выбери Свою Версию"
WelcomeText.TextColor3 = Color3.fromRGB(180, 180, 190)
WelcomeText.Font = Enum.Font.Gotham
WelcomeText.TextSize = 11
WelcomeText.TextXAlignment = Enum.TextXAlignment.Center

local MobileBtn = Instance.new("TextButton")
MobileBtn.Parent = SelectScreen
MobileBtn.Size = UDim2.new(0.85, 0, 0, 35)
MobileBtn.Position = UDim2.new(0.075, 0, 0, 85)
MobileBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MobileBtn.Text = "> Mobile Version"
MobileBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
MobileBtn.Font = Enum.Font.GothamBold
MobileBtn.TextSize = 12
MobileBtn.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", MobileBtn).CornerRadius = UDim.new(0, 6)

local PCBtn = Instance.new("TextButton")
PCBtn.Parent = SelectScreen
PCBtn.Size = UDim2.new(0.85, 0, 0, 35)
PCBtn.Position = UDim2.new(0.075, 0, 0, 130)
PCBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
PCBtn.Text = "> PC Version"
PCBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
PCBtn.Font = Enum.Font.GothamBold
PCBtn.TextSize = 12
PCBtn.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", PCBtn).CornerRadius = UDim.new(0, 6)

-- MAIN
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Main.ZIndex = 998
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MHeader = Instance.new("Frame")
MHeader.Parent = Main
MHeader.Size = UDim2.new(1, 0, 0, 35)
MHeader.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
Instance.new("UICorner", MHeader).CornerRadius = UDim.new(0, 10)

local MLogo = Instance.new("TextLabel")
MLogo.Parent = MHeader
MLogo.Size = UDim2.new(0, 120, 1, 0)
MLogo.Position = UDim2.new(0, 12, 0, 0)
MLogo.BackgroundTransparency = 1
MLogo.Text = "VelocityHub"
MLogo.TextColor3 = Color3.fromRGB(220, 220, 230)
MLogo.Font = Enum.Font.GothamBlack
MLogo.TextSize = 13
MLogo.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = MHeader
MinimizeBtn.Size = UDim2.new(0, 30, 0, 25)
MinimizeBtn.Position = UDim2.new(1, -40, 0.5, -12)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MinimizeBtn.Text = "_"
MinimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 12
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 4)

MinimizeBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

local Nav = Instance.new("Frame")
Nav.Parent = Main
Nav.Size = UDim2.new(0, 110, 1, -35)
Nav.Position = UDim2.new(0, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(10, 10, 13)

local NavLayout = Instance.new("UIListLayout")
NavLayout.Parent = Nav
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavLayout.Padding = UDim.new(0, 2)

local Pages = {}
local NavButtons = {}

local function CreateTab(name, icon, order)
    local btn = Instance.new("TextButton")
    btn.Parent = Nav
    btn.Size = UDim2.new(1, -15, 0, 28)
    btn.BackgroundTransparency = 1
    btn.Text = " " .. icon .. " " .. name
    btn.TextColor3 = Color3.fromRGB(130, 130, 140)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local page = Instance.new("ScrollingFrame")
    page.Parent = Main
    page.Size = UDim2.new(1, -115, 1, -42)
    page.Position = UDim2.new(0, 112, 0, 40)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = page
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    
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

local Visuals = CreateTab("Visuals", "//", 1)
local Combat = CreateTab("Combat", "#", 2)
local Effects = CreateTab("Effects", "~", 3)
local Config = CreateTab("Config", "=", 4)

Pages["Visuals"].Visible = true
NavButtons["Visuals"].TextColor3 = Color3.fromRGB(255, 255, 255)

local function AddToggle(page, text, key)
    local c = Instance.new("Frame")
    c.Parent = page
    c.Size = UDim2.new(0.95, 0, 0, 32)
    c.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    
    local btn = Instance.new("TextButton")
    btn.Parent = c
    btn.Size = UDim2.new(1, -50, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Position = UDim2.new(0, 10, 0, 0)
    
    local toggle = Instance.new("Frame")
    toggle.Parent = c
    toggle.Size = UDim2.new(0, 34, 0, 17)
    toggle.Position = UDim2.new(1, -42, 0.5, -8)
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)
    
    local dot = Instance.new("Frame")
    dot.Parent = toggle
    dot.Size = UDim2.new(0, 13, 0, 13)
    dot.Position = UDim2.new(0, 2, 0.5, -6)
    dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    
    if _G.VH[key] then
        toggle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
        dot.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        dot.Position = UDim2.new(1, -15, 0.5, -6)
    end
    
    btn.MouseButton1Click:Connect(function()
        _G.VH[key] = not _G.VH[key]
        if _G.VH[key] then
            toggle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            dot.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            dot.Position = UDim2.new(1, -15, 0.5, -6)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
            dot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
            dot.Position = UDim2.new(0, 2, 0.5, -6)
        end
    end)
end

local function AddSlider(page, text, key, min, max)
    local c = Instance.new("Frame")
    c.Parent = page
    c.Size = UDim2.new(0.95, 0, 0, 45)
    c.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel")
    label.Parent = c
    label.Size = UDim2.new(1, -60, 0, 18)
    label.Position = UDim2.new(0, 10, 0, 3)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.Font = Enum.Font.Gotham
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = c
    valueLabel.Size = UDim2.new(0, 40, 0, 18)
    valueLabel.Position = UDim2.new(1, -48, 0, 3)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(_G.VH[key])
    valueLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextSize = 10
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local minus = Instance.new("TextButton")
    minus.Parent = c
    minus.Size = UDim2.new(0, 25, 0, 18)
    minus.Position = UDim2.new(0, 10, 0, 25)
    minus.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    minus.Text = "-"
    minus.TextColor3 = Color3.fromRGB(180, 180, 190)
    minus.TextSize = 12
    Instance.new("UICorner", minus).CornerRadius = UDim.new(0, 4)
    
    local plus = Instance.new("TextButton")
    plus.Parent = c
    plus.Size = UDim2.new(0, 25, 0, 18)
    plus.Position = UDim2.new(0, 40, 0, 25)
    plus.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    plus.Text = "+"
    plus.TextColor3 = Color3.fromRGB(180, 180, 190)
    plus.TextSize = 12
    Instance.new("UICorner", plus).CornerRadius = UDim.new(0, 4)
    
    local bar = Instance.new("Frame")
    bar.Parent = c
    bar.Size = UDim2.new(1, -85, 0, 3)
    bar.Position = UDim2.new(0, 75, 0, 32)
    bar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame")
    fill.Parent = bar
    fill.Size = UDim2.new((_G.VH[key] - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    local function update()
        valueLabel.Text = tostring(_G.VH[key])
        fill.Size = UDim2.new((_G.VH[key] - min) / (max - min), 0, 1, 0)
    end
    
    minus.MouseButton1Click:Connect(function()
        if _G.VH[key] > min then
            _G.VH[key] = _G.VH[key] - 1
            update()
        end
    end)
    
    plus.MouseButton1Click:Connect(function()
        if _G.VH[key] < max then
            _G.VH[key] = _G.VH[key] + 1
            update()
        end
    end)
end

-- Visuals
AddToggle(Visuals, "ESP", "ESP")
AddToggle(Visuals, "Bullet Tracers", "BulletTracers")
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
AddSlider(Effects, "Snow Amount", "SnowAmount", 1, 10)

-- Config
AddToggle(Config, "Lite Optimization", "LiteOptimization")
AddToggle(Config, "Max Optimization", "MaxOptimization")

-- Activate
KBtn.MouseButton1Click:Connect(function()
    local nick = NickInput.Text:gsub("%s+", "")
    local key = KeyInput.Text:gsub("%s+", ""):upper()
    
    if nick == "" then
        KStatus.Text = "Введите никнейм!"
        KStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    if ValidKeys[key] then
        KStatus.Text = "Ключ активирован!"
        KStatus.TextColor3 = Color3.fromRGB(0, 255, 100)
        pcall(function() writefile("VH_Key.txt", key) end)
        pcall(function() writefile("VH_Nick.txt", nick) end)
        WelcomeText.Text = "Привет, " .. nick .. "! Выбери Свою Версию"
        task.wait(1)
        KeyScreen.Visible = false
        SelectScreen.Visible = true
    else
        KStatus.Text = "Неверный ключ!"
        KStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

MobileBtn.MouseButton1Click:Connect(function()
    SelectScreen.Visible = false
    Main.Size = UDim2.new(0, 320, 0, 400)
    Main.Position = UDim2.new(0.5, -160, 0.5, -200)
    Main.Visible = true
end)

PCBtn.MouseButton1Click:Connect(function()
    SelectScreen.Visible = false
    Main.Size = UDim2.new(0, 500, 0, 350)
    Main.Position = UDim2.new(0.5, -250, 0.5, -175)
    Main.Visible = true
end)

-- [ESP]
local function CreateESP(player)
    if player == LP or not player.Character then return end
    if player.Character:FindFirstChild("RedESP") then return end
    local hl = Instance.new("Highlight")
    hl.Name = "RedESP"
    hl.Parent = player.Character
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.OutlineColor = Color3.fromRGB(255, 0, 0)
    hl.FillTransparency = 0.5
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

local function RemoveESP()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local hl = p.Character:FindFirstChild("RedESP")
            if hl then hl:Destroy() end
        end
    end
end

-- [BULLET TRACERS]
local firing = false

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        firing = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        firing = false
    end
end)

local function CreateTracer()
    if not LP.Character or not LP.Character:FindFirstChild("Head") then return end
    
    local head = LP.Character.Head
    local direction = Camera.CFrame.LookVector * 100
    
    local beam = Instance.new("Beam")
    beam.Parent = workspace
    beam.Attachment0 = Instance.new("Attachment", head)
    beam.Attachment1 = Instance.new("Attachment")
    beam.Attachment1.Parent = workspace
    beam.Attachment1.WorldPosition = head.Position + direction
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 150))
    beam.Width0 = 2
    beam.Width1 = 2
    beam.Transparency = NumberSequence.new(0)
    beam.Enabled = true
    
    task.spawn(function()
        task.wait(0.1)
        beam:Destroy()
    end)
end

-- [SNOW]
local SnowParts = {}
local function CreateSnow()
    if #SnowParts > 0 then return end
    local base = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
    local range = _G.VH.SnowAmount
    for x = -range, range do
        for z = -range, range do
            local part = Instance.new("Part")
            part.Parent = workspace
            part.Size = Vector3.new(50, 1, 50)
            part.Position = Vector3.new(base.X + x*50, base.Y+40, base.Z + z*50)
            part.Transparency = 1
            part.Anchored = true
            part.CanCollide = false
            local em = Instance.new("ParticleEmitter")
            em.Parent = part
            em.Rate = 25
            em.Lifetime = NumberRange.new(25)
            em.Speed = NumberRange.new(2)
            em.VelocitySpread = 200
            em.SpreadAngle = Vector2.new(180, 180)
            em.Size = NumberSequence.new(1)
            em.Color = ColorSequence.new(Color3.fromRGB(255,255,255))
            em.Acceleration = Vector3.new(0,-2,0)
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

-- [OPTIMIZATION - КАРТОФЕЛЬ]
local OriginalMaterials = {}

local function ApplyMaxPotato()
    if _G.VH.MaxOptimization then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 30
        Lighting.Brightness = 1
        Lighting.Outlines = false
        workspace.Terrain.WaterWaveSize = 0
        workspace.Terrain.WaterWaveSpeed = 0
        
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                if not OriginalMaterials[v] then
                    OriginalMaterials[v] = {
                        Material = v.Material,
                        CastShadow = v.CastShadow
                    }
                end
                v.Material = Enum.Material.SmoothPlastic
                v.CastShadow = false
                v.Reflectance = 0
                v.Color = Color3.fromRGB(128, 128, 128)
            end
            if v:IsA("Texture") or v:IsA("Decal") then
                v.Transparency = 1
            end
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    else
        for v, data in pairs(OriginalMaterials) do
            if v and v.Parent then
                v.Material = data.Material
                v.CastShadow = data.CastShadow
                v.Reflectance = 0
            end
        end
        OriginalMaterials = {}
    end
end

local function ApplyLite()
    if _G.VH.LiteOptimization then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 300
    else
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 100000
    end
end

-- [RENDER]
RunService.RenderStepped:Connect(function()
    pcall(function()
        if not Main.Visible then return end
        
        if _G.VH.ESP then
            for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
        else
            RemoveESP()
        end
        
        if _G.VH.BulletTracers and firing then
            CreateTracer()
        end
        
        if _G.VH.FOVPlayer then
            Camera.FieldOfView = _G.VH.FOVValue
        else
            Camera.FieldOfView = 70
        end
        
        if _G.VH.ThirdPerson then
            LP.CameraMode = Enum.CameraMode.Classic
            LP.CameraMaxZoomDistance = _G.VH.TPDistance
            LP.CameraMinZoomDistance = 0.5
        end
        
        if LP.Character then
            for _, part in pairs(LP.Character:GetChildren()) do
                if part:IsA("BasePart") and (part.Name == "Left Arm" or part.Name == "Right Arm") then
                    part.Transparency = _G.VH.TransparentArms and 0.7 or 0
                end
            end
        end
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                if _G.VH.Hitbox then
                    head.Size = Vector3.new(_G.VH.HitboxSize, _G.VH.HitboxSize, _G.VH.HitboxSize)
                    head.Transparency = 0.4
                    head.CanCollide = false
                else
                    head.Size = Vector3.new(2, 1, 1)
                    head.Transparency = 0
                end
            end
        end
        
        if _G.VH.NightMode then
            Lighting.ClockTime = 0
            Lighting.Brightness = 0.1
        elseif _G.VH.FullBright then
            Lighting.ClockTime = 14
            Lighting.Brightness = 5
        else
            Lighting.ClockTime = 14
            Lighting.Brightness = 2
        end
    end)
end)

task.spawn(function() while true do ApplyLite() ApplyMaxPotato() task.wait(1) end end)
task.spawn(function() while true do task.wait(0.5) if _G.VH.Snow then CreateSnow() else RemoveSnow() end end end)
task.spawn(function() while true do task.wait(0.1) if _G.VH.NoRecoil then pcall(function() local tool = LP.Character and LP.Character:FindFirstChildWhichIsA("Tool") if tool then for _, v in pairs(tool:GetDescendants()) do if v:IsA("NumberValue") and string.find(string.lower(v.Name), "recoil") then v.Value = 0 end end end end) end end end)

