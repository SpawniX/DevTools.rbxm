-- ty krystalburger
--[[
    Thomas The Dank Engine:
                            By: KrystalTeam
                            Features: Being a dank engine that kill people
                            Version: 1.0.0.2
--]]

local p = game.Players.LocalPlayer.Character

local weld = Instance.new("Weld",p.Humanoid.Torso)
weld.Part0 = p.Humanoid.Torso

local train = Instance.new("Part",p.Humanoid.Torso)
train.Anchored = true
train.CanCollide = false
train.Size = Vector3.new(3,2,6)
train.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld.Part1 = train
weld.C1 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(180),0)
train.Anchored = false
local TrainMesh = Instance.new("SpecialMesh",train)
TrainMesh.MeshType = Enum.MeshType.FileMesh
TrainMesh.Scale = Vector3.new(0.020,0.020,0.015)
TrainMesh.MeshId = "rbxassetid://431017802"
TrainMesh.TextureId = "rbxassetid://431017809"


local weld2 = Instance.new("Weld",p.Humanoid.Torso)
weld2.Part0 = p.Humanoid.Torso
local Smoke = Instance.new("Part",p.Humanoid.Torso)
Smoke.Anchored = true
Smoke.CanCollide = false
Smoke.Size = Vector3.new(1,1,1)
Smoke.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
weld2.Part1 = Smoke
weld2.C1 = CFrame.new(0,-4,3.5)-- * CFrame.Angles(0,math.rad(180),0)
Smoke.Anchored = false
Smoke.Transparency = 1;

local Particle = Instance.new("ParticleEmitter",Smoke)
Particle.Rate = 50;
Particle.Speed = NumberRange.new(30,60);
Particle.VelocitySpread = 4;
Particle.Texture = "rbxassetid://133619974"

local Light = Instance.new("SpotLight",train)
Light.Angle = 45;
Light.Brightness = 100;
Light.Face = Enum.NormalId.Back;
Light.Range = 30;

p.Humanoid.WalkSpeed = 20;


for i,v in pairs(p:GetChildren()) do
    if v:IsA("Part") then
        v.Transparency = 1;
    elseif v:IsA("Hat") then
        v:Destroy()
    elseif v:IsA("Model") then
        v:Destroy()
    end
end

local function SFX(id) local s=Instance.new("Sound",p.Humanoid.Torso); s.SoundId = "rbxassetid://"..id; s.Volume = 1; return s; end
train.Touched:connect(function(p)
    if p.Parent then
        if p.Parent:IsA("Model") then
            if game.Players:FindFirstChild(p.Parent.Name) then
                if p.Parent.Name ~= game.Players.LocalPlayer.Name then
                    game.Players:FindFirstChild(p.Parent.Name).Character:BreakJoints()
                    local Whistle = SFX(604650009)
                    Whistle:Play()
                end
            end
        end
    end
end)
local sound   = Instance.new("Sound")
sound.SoundId = "http://www.roblox.com/asset/?id=198482531" --Change the last numbers of the link to the id of your audio.
sound.Parent  = game.Workspace
sound.Volume  = 200
sound.Looped  = true
sound:play()
repeat wait() until game.Players.LocalPlayer
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr = game.Players.LocalPlayer
Plr.Character.Humanoid.MaxHealth = math.huge 
Plr.Character.Humanoid.WalkSpeed = 100 
