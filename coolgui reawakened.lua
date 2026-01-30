local player = game.Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

pcall(function()
    pg.CoolExecutorGUI:Destroy()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "CoolExecutorGUI"
gui.ResetOnSpawn = false
gui.Parent = pg

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(660, 440)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderColor3 = Color3.fromRGB(255,0,0)
main.BorderSizePixel = 3
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,42)
title.BackgroundColor3 = Color3.fromRGB(25,0,0)
title.Text = "c00lkidd Reawakened"
title.TextColor3 = Color3.fromRGB(255,90,90)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 26

-- SOUND
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1839246711"
sound.Volume = 3
sound.Name = "KoopkidSound"
sound.Parent = game.SoundService

-- BUTTON FACTORY
local function makeButton(parent, text)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(100,28)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(18,18,18)
    b.BorderColor3 = Color3.fromRGB(255,0,0)
    b.TextColor3 = Color3.fromRGB(230,230,230)
    b.Font = Enum.Font.SourceSans
    b.TextSize = 13
    b.Parent = parent

    if text == "Koopkid Music" then
        b.BackgroundColor3 = Color3.fromRGB(40,0,0)
        b.MouseButton1Click:Connect(function()
            sound:Stop()
            sound:Play()
        end)
    else
        b.MouseButton1Click:Connect(function()
            print(text.." clicked")
        end)
    end
end

-- SECTION FACTORY
local function makeSection(name, x,y)
    local frame = Instance.new("Frame", main)
    frame.Position = UDim2.fromOffset(x,y)
    frame.Size = UDim2.fromOffset(210,180)
    frame.BackgroundColor3 = Color3.fromRGB(12,12,12)
    frame.BorderColor3 = Color3.fromRGB(255,0,0)
    frame.BorderSizePixel = 2

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,0,0,24)
    label.BackgroundColor3 = Color3.fromRGB(20,0,0)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255,120,120)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 15

    local scroll = Instance.new("ScrollingFrame", frame)
    scroll.Position = UDim2.fromOffset(0,24)
    scroll.Size = UDim2.new(1,0,1,-24)
    scroll.CanvasSize = UDim2.fromOffset(0,0)
    scroll.ScrollBarThickness = 8
    scroll.BackgroundTransparency = 1

    local layout = Instance.new("UIGridLayout", scroll)
    layout.CellSize = UDim2.fromOffset(100,28)
    layout.CellPadding = UDim2.fromOffset(6,6)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 6)
    end)

    return scroll
end

-- SECTIONS
local s1 = makeSection("Decal Spam",10,52)
local s2 = makeSection("Particles",225,52)
local s3 = makeSection("Server Destruction",440,52)
local s4 = makeSection("Skybox",10,240)
local s5 = makeSection("Sounds",225,240)
local s6 = makeSection("Extras",440,240)

-- BUTTON LISTS

local decals = {
"C00lkidd","Thomas","Team C00l","Team Thomas","K00pkidd",
"Glitch","Static","Error","Blood","Noise","TV","Corrupt"
}

local particles = {
"C00l Part","Thomas Part","Red Part","Dark Part","Spam",
"Fire","Smoke","Void","Aura","Burst","Storm","Flash"
}

local destroy = {
"Unanchor","Disco","Hint","Clear","Shutdown",
"Fire Rain","666","Explode","Jumpscare","Scary",
"C00l Ball","Lag","Spam Parts","Break"
}

local sky = {
"C00l Sky","Thomas Sky","Red Sky","Glitch Sky",
"Dark Sky","Void Sky","Storm Sky"
}

local sounds = {
"Won't Stop Us","Zombie Run","Relaxed Scene",
"Chaos","Static","Alarm","Koopkid Music"
}

local extras = {
"K00pgui","RC7","Visuals","Red FX",
"Ambush","A-60","Nightmare","Project",
"Overlay","Scan","Outline"
}

for _,t in ipairs(decals) do makeButton(s1,t) end
for _,t in ipairs(particles) do makeButton(s2,t) end
for _,t in ipairs(destroy) do makeButton(s3,t) end
for _,t in ipairs(sky) do makeButton(s4,t) end
for _,t in ipairs(sounds) do makeButton(s5,t) end
for _,t in ipairs(extras) do makeButton(s6,t) end

-- FOOTER
local footer = Instance.new("TextLabel", main)
footer.Size = UDim2.new(1,0,0,22)
footer.Position = UDim2.new(0,0,1,-22)
footer.BackgroundColor3 = Color3.fromRGB(20,0,0)
footer.Text = "Made by sigiemka"
footer.TextColor3 = Color3.fromRGB(255,90,90)
footer.Font = Enum.Font.SourceSans
footer.TextSize = 13