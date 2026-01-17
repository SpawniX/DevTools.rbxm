if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ChatLogGUI") then
    game.Players.LocalPlayer.PlayerGui.ChatLogGUI:Destroy()
end

local UI_POSITION = UDim2.new(0.01, 0, 0.65, 0)
local UI_SIZE = UDim2.new(0.25, 0, 0.3, 0)
local MAX_MESSAGES = 100

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChatLogGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "Background"
mainFrame.Size = UI_SIZE
mainFrame.Position = UI_POSITION
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "MessageContainer"
scrollingFrame.Size = UDim2.new(1, -5, 1, -5)
scrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
scrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Name = "Layout"
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 3)
listLayout.Parent = scrollingFrame

local function addMessage(player, message)
    message = message:gsub("<", "&lt;"):gsub(">", "&gt;")

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Message"
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, 0, 0, 16)
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    textLabel.RichText = true
    textLabel.Text = string.format('<font color="#ff5555">%s</font>: %s', player.Name, message)
    textLabel.AutomaticSize = Enum.AutomaticSize.Y
    textLabel.Parent = scrollingFrame

    if #scrollingFrame:GetChildren() > MAX_MESSAGES + 1 then
        local oldestMessage = scrollingFrame:GetChildren()[2]
        if oldestMessage and oldestMessage:IsA("TextLabel") then
            oldestMessage:Destroy()
        end
    end
    
    wait()
    scrollingFrame.CanvasPosition = Vector2.new(0, scrollingFrame.CanvasSize.Y)
end

local function onPlayerAdded(player)
    player.Chatted:Connect(function(message)
        addMessage(player, message)
    end)
end

for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
