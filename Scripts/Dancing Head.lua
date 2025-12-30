-- R6 Head Snake Animation (Side-to-Side Sliding, Not Rotating)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local torso = character:WaitForChild("Torso")
local neck = torso:WaitForChild("Neck")
local baseC0 = neck.C0
-- Settings
local amplitude = 0.6 -- How far the head slides left/right
local speed = 4 -- How fast it moves
local t = 0
RunService.RenderStepped:Connect(function(dt)
t += dt
-- X-axis slide using sine wave (no rotation)
local xOffset = math.sin(t * speed) * amplitude
neck.C0 = baseC0 * CFrame.new(xOffset, 0, 0)
end)
