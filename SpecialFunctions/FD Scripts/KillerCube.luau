--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]


local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local char = player.Character or player.CharacterAdded:Wait()

-- 1. НЕВИДИМОСТЬ
for _, part in pairs(char:GetDescendants()) do
    if part:IsA("BasePart") or part:IsA("Decal") then part.Transparency = 1 end
end

local function createCube(size, offset, name)
    local cube = Instance.new("Part", char)
    cube.Name = name; cube.Size = size; cube.Color = Color3.fromRGB(100, 100, 100)
    cube.Material = Enum.Material.Neon; cube.CanCollide = false
    local weld = Instance.new("Weld", cube)
    weld.Part0 = char.HumanoidRootPart; weld.Part1 = cube; weld.C0 = offset
    return cube
end

-- 2. ТЕЛО (Голова теперь ровно на 0 по X и смотрит ПРЯМО)
local head = createCube(Vector3.new(2.5, 2.5, 2.5), CFrame.new(0, 4, 0), "CubeHead")
local lHand = createCube(Vector3.new(1.5, 1.5, 1.5), CFrame.new(-3, 1, 0), "LeftHand")
local rHand = createCube(Vector3.new(1.5, 1.5, 1.5), CFrame.new(3, 1, 0), "RightHand")

-- 3. ОРУЖИЕ (Меч -180, Нож -90)
local function addWeapon(id, parentPart, offset)
    local obj = game:GetObjects("rbxassetid://"..id)[1]
    obj.Parent = char
    for _, v in pairs(obj:GetDescendants()) do
        if v:IsA("Script") or v:IsA("LocalScript") then v:Destroy() end
    end
    local handle = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
    if handle then
        handle.CanCollide = false
        local w = Instance.new("Weld", handle)
        w.Part0 = parentPart; w.Part1 = handle; w.C0 = offset
    end
end

addWeapon(47433, rHand, CFrame.new(0, 0, -2) * CFrame.Angles(math.rad(-180), 0, 0))
addWeapon(3576051114, lHand, CFrame.new(0, 0, -1.5) * CFrame.Angles(math.rad(-90), 0, 0))

-- 4. ЗВУКИ
local sKnife = Instance.new("Sound", char.HumanoidRootPart)
sKnife.SoundId = "rbxassetid://136518851744814"
local sSword = Instance.new("Sound", char.HumanoidRootPart)
sSword.SoundId = "rbxassetid://111147793954530"

-- 5. АТАКА
mouse.Button1Down:Connect(function()
    sKnife:Play(); sSword:Play()
    lHand.Weld.C0 = lHand.Weld.C0 * CFrame.new(0,0,-2.5)
    rHand.Weld.C0 = rHand.Weld.C0 * CFrame.new(0,0,-2.5)
    task.wait(0.08)
    lHand.Weld.C0 = CFrame.new(-3, 1, 0)
    rHand.Weld.C0 = CFrame.new(3, 1, 0)
end)

-- 6. НОВАЯ ПЛАВНАЯ АНИМАЦИЯ (БЕЗ ВРАЩЕНИЯ ГОЛОВЫ)
spawn(function()
    while task.wait() do
        local t = tick()
        -- Голова плавно ходит вверх-вниз по оси Y (4 + синус)
        head.Weld.C0 = CFrame.new(0, 4 + math.sin(t*1.5)*0.4, 0) 
        
        -- Руки плавно качаются
        lHand.Weld.C0 = lHand.Weld.C0:Lerp(CFrame.new(-3, 1 + math.cos(t*3)*0.4, 0.5 * math.sin(t)), 0.1)
        rHand.Weld.C0 = rHand.Weld.C0:Lerp(CFrame.new(3, 1 + math.sin(t*3)*0.4, 0.5 * math.cos(t)), 0.1)
    end
end)

print("Глеб, V9 готова! Голова ровная и плавает вверх-вниз. ⚔️🦾🧱")
