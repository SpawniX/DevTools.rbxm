local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LogService = game:GetService("LogService")
local RunService = game:GetService("RunService")

if gethui():FindFirstChild("Fex Console") then
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Fex Console", Text = "Already open!", Duration = 2})
    return
end

local mobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled

local c = {
    bg = Color3.fromRGB(15, 15, 18),
    card = Color3.fromRGB(22, 22, 28),
    card2 = Color3.fromRGB(30, 30, 38),
    card3 = Color3.fromRGB(40, 40, 50),
    accent = Color3.fromRGB(99, 102, 241),
    accentDark = Color3.fromRGB(79, 82, 201),
    accentGlow = Color3.fromRGB(139, 142, 255),
    txt = Color3.fromRGB(250, 250, 252),
    txt2 = Color3.fromRGB(150, 150, 165),
    txt3 = Color3.fromRGB(80, 80, 95),
    info = Color3.fromRGB(100, 210, 255),
    err = Color3.fromRGB(255, 100, 120),
    warn = Color3.fromRGB(255, 190, 50),
    ok = Color3.fromRGB(80, 230, 170),
    border = Color3.fromRGB(50, 50, 62),
    white = Color3.fromRGB(255, 255, 255),
    select = Color3.fromRGB(99, 102, 241)
}

local msgCfg = {
    [Enum.MessageType.MessageOutput] = {c = c.txt, bar = c.txt2, bg = c.card2},
    [Enum.MessageType.MessageInfo] = {c = c.info, bar = c.info, bg = Color3.fromRGB(22, 35, 45)},
    [Enum.MessageType.MessageError] = {c = c.err, bar = c.err, bg = Color3.fromRGB(45, 22, 28)},
    [Enum.MessageType.MessageWarning] = {c = c.warn, bar = c.warn, bg = Color3.fromRGB(45, 38, 20)}
}

local filters = {
    [Enum.MessageType.MessageOutput] = true,
    [Enum.MessageType.MessageInfo] = true,
    [Enum.MessageType.MessageError] = true,
    [Enum.MessageType.MessageWarning] = true,
    ts = true
}

local logs = {}
local logFrames = {}
local logDeselect = {}
local selectedLog = nil
local hoveredLog = nil
local refreshLogs

local gui = Instance.new("ScreenGui")
gui.Name = "Fex Console"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local openBtn = Instance.new("ImageButton")
openBtn.Name = "Open"
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 20, 0.5, -25)
openBtn.BackgroundColor3 = c.card
openBtn.Image = "rbxassetid://140731965561550"
openBtn.ImageColor3 = c.white
openBtn.Visible = false
openBtn.Parent = gui
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 14)
local obs = Instance.new("UIStroke", openBtn)
obs.Color = c.border
obs.Thickness = 1.5
obs.Transparency = 0.3

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 450, 0, 380)
main.Position = UDim2.new(0.5, -225, 0.5, -190)
main.BackgroundColor3 = c.bg
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
local ms = Instance.new("UIStroke", main)
ms.Color = c.border
ms.Thickness = 1.5
ms.Transparency = 0.2

local top = Instance.new("Frame", main)
top.Name = "Top"
top.Size = UDim2.new(1, 0, 0, 58)
top.BackgroundTransparency = 1

local ico = Instance.new("Frame", top)
ico.Size = UDim2.new(0, 38, 0, 38)
ico.Position = UDim2.new(0, 16, 0.5, -19)
ico.BackgroundColor3 = c.accent
Instance.new("UICorner", ico).CornerRadius = UDim.new(0, 10)

local icoGrad = Instance.new("UIGradient", ico)
icoGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 142, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(99, 102, 241))
}
icoGrad.Rotation = 45

local icoImg = Instance.new("ImageLabel", ico)
icoImg.Size = UDim2.new(0, 20, 0, 20)
icoImg.Position = UDim2.new(0.5, -10, 0.5, -10)
icoImg.BackgroundTransparency = 1
icoImg.Image = "rbxassetid://133357571737065"
icoImg.ImageColor3 = c.white

local ttlFrame = Instance.new("Frame", top)
ttlFrame.Size = UDim2.new(0, 90, 0, 22)
ttlFrame.Position = UDim2.new(0, 62, 0, 11)
ttlFrame.BackgroundTransparency = 1

local ttlText = "Fex Console"
for i = 1, #ttlText do
    local ch = Instance.new("TextLabel", ttlFrame)
    ch.Size = UDim2.new(0, 11, 1, 0)
    ch.Position = UDim2.new(0, (i - 1) * 11, 0, 0)
    ch.BackgroundTransparency = 1
    ch.Text = ttlText:sub(i, i)
    ch.TextColor3 = c.white
    ch.TextSize = 17
    ch.Font = Enum.Font.GothamBlack
    ch.Name = "C" .. i
end

local sub = Instance.new("TextLabel", top)
sub.Size = UDim2.new(0, 130, 0, 14)
sub.Position = UDim2.new(0, 62, 0, 35)
sub.BackgroundTransparency = 1
sub.Text = "Developer Console"
sub.TextColor3 = c.txt3
sub.TextSize = 11
sub.Font = Enum.Font.GothamMedium
sub.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("ImageButton", top)
closeBtn.Size = UDim2.new(0, 34, 0, 34)
closeBtn.Position = UDim2.new(1, -48, 0.5, -17)
closeBtn.BackgroundColor3 = c.card2
closeBtn.Image = "rbxassetid://84068170784640"
closeBtn.ImageColor3 = c.white
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

local divider = Instance.new("Frame", main)
divider.Size = UDim2.new(1, -32, 0, 1)
divider.Position = UDim2.new(0, 16, 0, 58)
divider.BackgroundColor3 = c.border
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0

local toolbar = Instance.new("Frame", main)
toolbar.Size = UDim2.new(1, -32, 0, 38)
toolbar.Position = UDim2.new(0, 16, 0, 66)
toolbar.BackgroundTransparency = 1

local srchF = Instance.new("Frame", toolbar)
srchF.Size = UDim2.new(1, -96, 1, 0)
srchF.BackgroundColor3 = c.card
Instance.new("UICorner", srchF).CornerRadius = UDim.new(0, 8)
local srchS = Instance.new("UIStroke", srchF)
srchS.Color = c.border
srchS.Transparency = 0.5

local srchIco = Instance.new("ImageLabel", srchF)
srchIco.Size = UDim2.new(0, 14, 0, 14)
srchIco.Position = UDim2.new(0, 12, 0.5, -7)
srchIco.BackgroundTransparency = 1
srchIco.Image = "rbxassetid://98591006814710"
srchIco.ImageColor3 = c.txt3

local srch = Instance.new("TextBox", srchF)
srch.Size = UDim2.new(1, -42, 1, 0)
srch.Position = UDim2.new(0, 32, 0, 0)
srch.BackgroundTransparency = 1
srch.Text = ""
srch.PlaceholderText = "Search..."
srch.TextColor3 = c.txt
srch.PlaceholderColor3 = c.txt3
srch.TextSize = 12
srch.Font = Enum.Font.Gotham
srch.TextXAlignment = Enum.TextXAlignment.Left
srch.ClearTextOnFocus = false

local function mkToolBtn(icon, pos)
    local b = Instance.new("ImageButton", toolbar)
    b.Size = UDim2.new(0, 38, 0, 38)
    b.Position = pos
    b.BackgroundColor3 = c.card
    b.Image = icon
    b.ImageColor3 = c.white
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local bs = Instance.new("UIStroke", b)
    bs.Color = c.border
    bs.Transparency = 0.5
    if not mobile then
        b.MouseEnter:Connect(function()
            TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = c.accent}):Play()
        end)
        b.MouseLeave:Connect(function()
            TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = c.card}):Play()
        end)
    end
    return b
end

local clearBtn = mkToolBtn("rbxassetid://76953295456242", UDim2.new(1, -84, 0, 0))
local filterBtn = mkToolBtn("rbxassetid://99940223226746", UDim2.new(1, -42, 0, 0))

local cont = Instance.new("ScrollingFrame", main)
cont.Name = "Content"
cont.Size = UDim2.new(1, -32, 1, -168)
cont.Position = UDim2.new(0, 16, 0, 110)
cont.BackgroundColor3 = c.card
cont.BorderSizePixel = 0
cont.ScrollBarThickness = 3
cont.ScrollBarImageColor3 = c.accent
cont.ScrollBarImageTransparency = 0.2
cont.CanvasSize = UDim2.new(0, 0, 0, 0)
cont.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", cont).CornerRadius = UDim.new(0, 12)
local cs = Instance.new("UIStroke", cont)
cs.Color = c.border
cs.Transparency = 0.5

local cl = Instance.new("UIListLayout", cont)
cl.SortOrder = Enum.SortOrder.LayoutOrder
cl.Padding = UDim.new(0, 6)

local cp = Instance.new("UIPadding", cont)
cp.PaddingTop = UDim.new(0, 10)
cp.PaddingBottom = UDim.new(0, 10)
cp.PaddingLeft = UDim.new(0, 10)
cp.PaddingRight = UDim.new(0, 10)

local bot = Instance.new("Frame", main)
bot.Size = UDim2.new(1, -32, 0, 44)
bot.Position = UDim2.new(0, 16, 1, -52)
bot.BackgroundTransparency = 1

local copyBtn = Instance.new("TextButton", bot)
copyBtn.Size = UDim2.new(0, 110, 0, 36)
copyBtn.Position = UDim2.new(0, 0, 0.5, -18)
copyBtn.BackgroundColor3 = c.accent
copyBtn.Text = "Copy All"
copyBtn.TextColor3 = c.white
copyBtn.TextSize = 12
copyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 8)

local copyGrad = Instance.new("UIGradient", copyBtn)
copyGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(119, 122, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(89, 92, 221))
}
copyGrad.Rotation = 90

local countLbl = Instance.new("TextLabel", bot)
countLbl.Size = UDim2.new(0, 90, 0, 20)
countLbl.Position = UDim2.new(1, -90, 0.5, -10)
countLbl.BackgroundTransparency = 1
countLbl.Text = "0 logs"
countLbl.TextColor3 = c.txt3
countLbl.TextSize = 12
countLbl.Font = Enum.Font.GothamMedium
countLbl.TextXAlignment = Enum.TextXAlignment.Right

local fMenu = Instance.new("Frame", main)
fMenu.Size = UDim2.new(0, 145, 0, 182)
fMenu.Position = UDim2.new(1, -161, 0, 108)
fMenu.BackgroundColor3 = c.card
fMenu.Visible = false
fMenu.ZIndex = 20
Instance.new("UICorner", fMenu).CornerRadius = UDim.new(0, 12)
local fms = Instance.new("UIStroke", fMenu)
fms.Color = c.border
fms.Transparency = 0.3

local fTitle = Instance.new("TextLabel", fMenu)
fTitle.Size = UDim2.new(1, 0, 0, 34)
fTitle.BackgroundTransparency = 1
fTitle.Text = "   Filters"
fTitle.TextColor3 = c.txt2
fTitle.TextSize = 11
fTitle.Font = Enum.Font.GothamBold
fTitle.TextXAlignment = Enum.TextXAlignment.Left
fTitle.ZIndex = 21

local fList = Instance.new("Frame", fMenu)
fList.Size = UDim2.new(1, -14, 1, -42)
fList.Position = UDim2.new(0, 7, 0, 34)
fList.BackgroundTransparency = 1
fList.ZIndex = 21

local fl = Instance.new("UIListLayout", fList)
fl.SortOrder = Enum.SortOrder.LayoutOrder
fl.Padding = UDim.new(0, 4)

local function mkFilter(name, key, col)
    local f = Instance.new("TextButton", fList)
    f.Size = UDim2.new(1, 0, 0, 26)
    f.BackgroundColor3 = c.card2
    f.Text = ""
    f.ZIndex = 22
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local check = Instance.new("Frame", f)
    check.Size = UDim2.new(0, 16, 0, 16)
    check.Position = UDim2.new(0, 7, 0.5, -8)
    check.BackgroundColor3 = col or c.ok
    check.ZIndex = 23
    Instance.new("UICorner", check).CornerRadius = UDim.new(0, 4)

    local checkIco = Instance.new("ImageLabel", check)
    checkIco.Size = UDim2.new(0, 10, 0, 10)
    checkIco.Position = UDim2.new(0.5, -5, 0.5, -5)
    checkIco.BackgroundTransparency = 1
    checkIco.Image = "rbxassetid://92483057544498"
    checkIco.ImageColor3 = c.bg
    checkIco.ZIndex = 24

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -30, 1, 0)
    lbl.Position = UDim2.new(0, 28, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = c.txt
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 23

    local function upd()
        if filters[key] then
            check.BackgroundColor3 = col or c.ok
            checkIco.Visible = true
        else
            check.BackgroundColor3 = c.card3
            checkIco.Visible = false
        end
    end
    upd()

    f.MouseButton1Click:Connect(function()
        filters[key] = not filters[key]
        upd()
        refreshLogs()
    end)
end

mkFilter("Output", Enum.MessageType.MessageOutput, c.txt2)
mkFilter("Info", Enum.MessageType.MessageInfo, c.info)
mkFilter("Warning", Enum.MessageType.MessageWarning, c.warn)
mkFilter("Error", Enum.MessageType.MessageError, c.err)
mkFilter("Time", "ts", c.accent)

local function updateCopyBtn()
    copyBtn.Text = selectedLog and "Copy" or "Copy All"
end

local function mkLog(msg, typ, time, idx)
    local cfg = msgCfg[typ] or msgCfg[Enum.MessageType.MessageOutput]

    local f = Instance.new("TextButton")
    f.Size = UDim2.new(1, 0, 0, 0)
    f.AutomaticSize = Enum.AutomaticSize.Y
    f.BackgroundColor3 = cfg.bg
    f.Text = ""
    f.AutoButtonColor = false
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(0, 3, 1, 0)
    bar.Position = UDim2.new(0, 0, 0, 0)
    bar.BackgroundColor3 = cfg.bar
    bar.BorderSizePixel = 0
    local barC = Instance.new("UICorner", bar)
    barC.CornerRadius = UDim.new(0, 8)

    local inner = Instance.new("Frame", f)
    inner.Size = UDim2.new(1, 0, 0, 0)
    inner.AutomaticSize = Enum.AutomaticSize.Y
    inner.BackgroundTransparency = 1

    local pad = Instance.new("UIPadding", inner)
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingBottom = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 14)
    pad.PaddingRight = UDim.new(0, 12)

    local ts
    if filters.ts then
        ts = Instance.new("TextLabel", inner)
        ts.Size = UDim2.new(0, 55, 0, 14)
        ts.BackgroundTransparency = 1
        ts.Text = os.date("%H:%M:%S", time)
        ts.TextColor3 = c.txt3
        ts.TextSize = 10
        ts.Font = Enum.Font.Code
        ts.TextXAlignment = Enum.TextXAlignment.Left
    end

    local t = Instance.new("TextLabel", inner)
    t.Size = UDim2.new(1, 0, 0, 0)
    t.Position = filters.ts and UDim2.new(0, 0, 0, 16) or UDim2.new(0, 0, 0, 0)
    t.AutomaticSize = Enum.AutomaticSize.Y
    t.BackgroundTransparency = 1
    t.TextColor3 = cfg.c
    t.TextSize = 12
    t.Font = Enum.Font.Code
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.TextYAlignment = Enum.TextYAlignment.Top
    t.TextWrapped = true
    t.Text = msg

    local function setHover(on)
        if selectedLog == idx then return end
        if on then
            TS:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = c.card3}):Play()
            TS:Create(bar, TweenInfo.new(0.1), {BackgroundColor3 = c.accent}):Play()
        else
            TS:Create(f, TweenInfo.new(0.1), {BackgroundColor3 = cfg.bg}):Play()
            TS:Create(bar, TweenInfo.new(0.1), {BackgroundColor3 = cfg.bar}):Play()
        end
    end

    local function setSelect(on)
        if on then
            TS:Create(f, TweenInfo.new(0.08), {BackgroundColor3 = c.select}):Play()
            TS:Create(bar, TweenInfo.new(0.08), {BackgroundColor3 = c.white}):Play()
            TS:Create(t, TweenInfo.new(0.08), {TextColor3 = c.white}):Play()
            if ts then TS:Create(ts, TweenInfo.new(0.08), {TextColor3 = Color3.fromRGB(200, 200, 220)}):Play() end
        else
            TS:Create(f, TweenInfo.new(0.08), {BackgroundColor3 = cfg.bg}):Play()
            TS:Create(bar, TweenInfo.new(0.08), {BackgroundColor3 = cfg.bar}):Play()
            TS:Create(t, TweenInfo.new(0.08), {TextColor3 = cfg.c}):Play()
            if ts then TS:Create(ts, TweenInfo.new(0.08), {TextColor3 = c.txt3}):Play() end
        end
    end

    if not mobile then
        f.MouseEnter:Connect(function()
            hoveredLog = idx
            setHover(true)
        end)
        f.MouseLeave:Connect(function()
            if hoveredLog == idx then hoveredLog = nil end
            setHover(false)
        end)
    end

    f.MouseButton1Click:Connect(function()
        if selectedLog == idx then
            selectedLog = nil
            setSelect(false)
        else
            if selectedLog and logDeselect[selectedLog] then
                logDeselect[selectedLog]()
            end
            selectedLog = idx
            setSelect(true)
        end
        updateCopyBtn()
    end)

    logDeselect[idx] = function()
        setSelect(false)
    end

    logFrames[idx] = f
    return f
end

local function updateCount()
    local n = 0
    for _, log in logs do
        if filters[log.t] then n = n + 1 end
    end
    countLbl.Text = n .. " log" .. (n == 1 and "" or "s")
end

refreshLogs = function()
    for _, ch in cont:GetChildren() do
        if ch:IsA("TextButton") then ch:Destroy() end
    end
    logFrames = {}
    logDeselect = {}
    selectedLog = nil
    hoveredLog = nil
    updateCopyBtn()
    local s = srch.Text:lower()
    for idx, log in logs do
        local ok = filters[log.t]
        if ok and s ~= "" then
            ok = log.m:lower():find(s, 1, true) ~= nil
        end
        if ok then
            local item = mkLog(log.m, log.t, log.ts, idx)
            item.LayoutOrder = idx
            item.Parent = cont
        end
    end
    updateCount()
end

local function addLog(msg, typ)
    local idx = #logs + 1
    table.insert(logs, {m = msg, t = typ, ts = os.time()})
    if filters[typ] then
        local s = srch.Text:lower()
        if s == "" or msg:lower():find(s, 1, true) then
            local item = mkLog(msg, typ, os.time(), idx)
            item.LayoutOrder = idx
            item.Parent = cont
        end
    end
    updateCount()
end

local function mkDrag(handle, frame)
    local drag, start, spos
    handle.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            drag = true
            start = inp.Position
            spos = frame.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then drag = false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(inp)
        if drag and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
            local d = inp.Position - start
            frame.Position = UDim2.new(spos.X.Scale, spos.X.Offset + d.X, spos.Y.Scale, spos.Y.Offset + d.Y)
        end
    end)
end

mkDrag(top, main)
mkDrag(openBtn, openBtn)

local function toggle(show)
    if show then
        main.Visible = true
        openBtn.Visible = false
        main.BackgroundTransparency = 1
        for _, v in main:GetDescendants() do
            if v:IsA("GuiObject") then v.Visible = false end
        end
        TS:Create(main, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundTransparency = 0}):Play()
        task.delay(0.04, function()
            for _, v in main:GetDescendants() do
                if v:IsA("GuiObject") and v.Name ~= "Open" then v.Visible = true end
            end
            fMenu.Visible = false
        end)
    else
        TS:Create(main, TweenInfo.new(0.12), {BackgroundTransparency = 1}):Play()
        task.delay(0.12, function()
            main.Visible = false
            openBtn.Visible = true
        end)
    end
end

closeBtn.MouseButton1Click:Connect(function() toggle(false) end)
openBtn.MouseButton1Click:Connect(function() toggle(true) end)

if not mobile then
    closeBtn.MouseEnter:Connect(function()
        TS:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.err}):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TS:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.card2}):Play()
    end)
    copyBtn.MouseEnter:Connect(function()
        TS:Create(copyBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.accentDark}):Play()
    end)
    copyBtn.MouseLeave:Connect(function()
        TS:Create(copyBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.accent}):Play()
    end)
    openBtn.MouseEnter:Connect(function()
        TS:Create(openBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.accent}):Play()
    end)
    openBtn.MouseLeave:Connect(function()
        TS:Create(openBtn, TweenInfo.new(0.1), {BackgroundColor3 = c.card}):Play()
    end)
end

local fOpen = false
filterBtn.MouseButton1Click:Connect(function()
    fOpen = not fOpen
    fMenu.Visible = fOpen
end)

UIS.InputBegan:Connect(function(inp)
    if not fOpen then return end
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        task.wait()
        local p = inp.Position
        local mp, mz = fMenu.AbsolutePosition, fMenu.AbsoluteSize
        local bp, bz = filterBtn.AbsolutePosition, filterBtn.AbsoluteSize
        local inM = p.X >= mp.X and p.X <= mp.X + mz.X and p.Y >= mp.Y and p.Y <= mp.Y + mz.Y
        local inB = p.X >= bp.X and p.X <= bp.X + bz.X and p.Y >= bp.Y and p.Y <= bp.Y + bz.Y
        if not inM and not inB then
            fOpen = false
            fMenu.Visible = false
        end
    end
end)

copyBtn.MouseButton1Click:Connect(function()
    local txt = ""
    if selectedLog and logs[selectedLog] then
        local log = logs[selectedLog]
        txt = "[" .. os.date("%H:%M:%S", log.ts) .. "] " .. log.m
    else
        local s = srch.Text:lower()
        for _, log in logs do
            local ok = filters[log.t]
            if ok and s ~= "" then ok = log.m:lower():find(s, 1, true) ~= nil end
            if ok then
                txt = txt .. "[" .. os.date("%H:%M:%S", log.ts) .. "] " .. log.m .. "\n"
            end
        end
    end
    setclipboard(txt)
    copyBtn.Text = "Copied!"
    TS:Create(copyBtn, TweenInfo.new(0.08), {BackgroundColor3 = c.ok}):Play()
    task.delay(0.5, function()
        updateCopyBtn()
        TS:Create(copyBtn, TweenInfo.new(0.12), {BackgroundColor3 = c.accent}):Play()
    end)
end)

clearBtn.MouseButton1Click:Connect(function()
    logs = {}
    logFrames = {}
    logDeselect = {}
    selectedLog = nil
    hoveredLog = nil
    updateCopyBtn()
    for _, ch in cont:GetChildren() do
        if ch:IsA("TextButton") then ch:Destroy() end
    end
    updateCount()
end)

srch:GetPropertyChangedSignal("Text"):Connect(refreshLogs)

local hue = 0
RunService.Heartbeat:Connect(function(dt)
    hue = (hue + dt * 0.2) % 1
    for i = 1, #ttlText do
        local ch = ttlFrame:FindFirstChild("C" .. i)
        if ch then
            local h = (hue + (i - 1) * 0.1) % 1
            ch.TextColor3 = Color3.fromHSV(h, 0.6, 1)
        end
    end
end)

local conn = LogService.MessageOut:Connect(function(msg, typ)
    task.spawn(addLog, msg, typ)
end)

gui.Parent = gethui()

gui.Destroying:Connect(function()
    conn:Disconnect()
end)
