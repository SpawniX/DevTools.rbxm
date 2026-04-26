
local player   = game.Players.LocalPlayer
local HttpSvc  = game:GetService("HttpService")

local old = player.PlayerGui:FindFirstChild("DevToolsR2H")
if old then old:Destroy() end

local C = {
    bg      = Color3.fromRGB(8,  8,  10),
    panel   = Color3.fromRGB(15, 15, 18),
    item    = Color3.fromRGB(22, 22, 28),
    hover   = Color3.fromRGB(32, 32, 40),
    border  = Color3.fromRGB(40, 40, 52),
    accent  = Color3.fromRGB(48, 140, 255),
    green   = Color3.fromRGB(40, 200, 100),
    orange  = Color3.fromRGB(220, 120, 30),
    red     = Color3.fromRGB(220, 60,  60),
    white   = Color3.fromRGB(230, 230, 235),
    dim     = Color3.fromRGB(110, 110, 125),
    yellow  = Color3.fromRGB(255, 210, 50),
    logGreen= Color3.fromRGB(60,  220, 130),
}

local function Corner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 6)
    c.Parent = p
    return c
end
local function Stroke(p, col, t)
    local s = Instance.new("UIStroke")
    s.Color = col or C.border
    s.Thickness = t or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = p
end
local function Pad(p, px)
    local u = Instance.new("UIPadding")
    u.PaddingLeft   = UDim.new(0, px)
    u.PaddingRight  = UDim.new(0, px)
    u.PaddingTop    = UDim.new(0, px)
    u.PaddingBottom = UDim.new(0, px)
    u.Parent = p
end
local function Label(parent, txt, size, col, font, xAlign)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text = txt or ""
    l.TextSize = size or 13
    l.TextColor3 = col or C.white
    l.Font = font or Enum.Font.Gotham
    l.TextXAlignment = xAlign or Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end
local function Btn(parent, txt, bg, size, font)
    local b = Instance.new("TextButton")
    b.BackgroundColor3 = bg or C.accent
    b.Text = txt or ""
    b.TextSize = size or 13
    b.TextColor3 = C.white
    b.Font = font or Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.BorderSizePixel = 0
    b.Parent = parent
    Corner(b, 6)
    b.MouseEnter:Connect(function() b.BackgroundColor3 = Color3.new(bg.R*1.15, bg.G*1.15, bg.B*1.15) end)
    b.MouseLeave:Connect(function() b.BackgroundColor3 = bg end)
    return b
end

local gui = Instance.new("ScreenGui")
gui.Name            = "DevToolsR2H"
gui.ResetOnSpawn    = false
gui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder    = 999
gui.Parent          = player:WaitForChild("PlayerGui")

local root = Instance.new("Frame")
root.Name              = "Root"
root.Size              = UDim2.new(0, 700, 0, 600)
root.Position          = UDim2.new(0.5, -350, 0.5, -300)
root.BackgroundColor3  = C.bg
root.BorderSizePixel   = 0
root.Active            = true
root.Draggable         = true
root.ClipsDescendants  = true
root.Parent            = gui
Corner(root, 10)
Stroke(root, Color3.fromRGB(55, 55, 70), 1)

local titleBar = Instance.new("Frame")
titleBar.Size             = UDim2.new(1, 0, 0, 44)
titleBar.BackgroundColor3 = C.panel
titleBar.BorderSizePixel  = 0
titleBar.Parent           = root
Corner(titleBar, 10)

local stripe = Instance.new("Frame")
stripe.Size             = UDim2.new(0, 3, 0, 28)
stripe.Position         = UDim2.new(0, 12, 0.5, -14)
stripe.BackgroundColor3 = C.accent
stripe.BorderSizePixel  = 0
stripe.Parent           = titleBar
Corner(stripe, 2)

local titleLbl = Label(titleBar, "DevTools  —  Roblox2HTML", 14, C.white, Enum.Font.GothamBold)
titleLbl.Size     = UDim2.new(1, -120, 1, 0)
titleLbl.Position = UDim2.new(0, 24, 0, 0)

local versionLbl = Label(titleBar, "v2.0", 11, C.dim, Enum.Font.Gotham)
versionLbl.Size     = UDim2.new(0, 30, 1, 0)
versionLbl.Position = UDim2.new(0, 200, 0, 0)

local minBtn = Btn(titleBar, "–", Color3.fromRGB(180, 130, 0), 14)
minBtn.Size     = UDim2.new(0, 28, 0, 28)
minBtn.Position = UDim2.new(1, -70, 0.5, -14)
minBtn.TextXAlignment = Enum.TextXAlignment.Center

local closeBtn = Btn(titleBar, "✕", C.red, 13)
closeBtn.Size     = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -36, 0.5, -14)
closeBtn.TextXAlignment = Enum.TextXAlignment.Center
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local body = Instance.new("Frame")
body.Size             = UDim2.new(1, 0, 1, -44)
body.Position         = UDim2.new(0, 0, 0, 44)
body.BackgroundTransparency = 1
body.Parent           = root

local bodyVisible = true
minBtn.MouseButton1Click:Connect(function()
    bodyVisible = not bodyVisible
    body.Visible = bodyVisible
    root.Size = bodyVisible and UDim2.new(0, 700, 0, 600) or UDim2.new(0, 700, 0, 44)
end)

local btnRow = Instance.new("Frame")
btnRow.Size             = UDim2.new(1, -20, 0, 38)
btnRow.Position         = UDim2.new(0, 10, 0, 10)
btnRow.BackgroundTransparency = 1
btnRow.Parent           = body

local exportBtn   = Btn(btnRow, "▶  EXPORT MAP",  Color3.fromRGB(25, 130, 65), 13)
exportBtn.Size     = UDim2.new(0, 158, 1, 0)
exportBtn.Position = UDim2.new(0, 0, 0, 0)

local copyHTMLBtn = Btn(btnRow, "⧉  COPY HTML",  C.accent, 13)
copyHTMLBtn.Size     = UDim2.new(0, 145, 1, 0)
copyHTMLBtn.Position = UDim2.new(0, 164, 0, 0)

local copyJSONBtn = Btn(btnRow, "{ }  COPY JSON", C.orange, 13)
copyJSONBtn.Size     = UDim2.new(0, 145, 1, 0)
copyJSONBtn.Position = UDim2.new(0, 315, 0, 0)

local clearBtn = Btn(btnRow, "✕  CLEAR",        Color3.fromRGB(70, 20, 22), 13)
clearBtn.Size     = UDim2.new(0, 85, 1, 0)
clearBtn.Position = UDim2.new(0, 466, 0, 0)

local settingsLbl = Label(btnRow, "⚙", 18, C.dim, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
settingsLbl.Size     = UDim2.new(0, 30, 1, 0)
settingsLbl.Position = UDim2.new(0, 557, 0, 0)

local options = { textures=true, meshes=true, transparency=true, spawns=true, lights=true, shadows=true }

local optRow = Instance.new("Frame")
optRow.Size             = UDim2.new(1, -20, 0, 28)
optRow.Position         = UDim2.new(0, 10, 0, 54)
optRow.BackgroundTransparency = 1
optRow.Parent           = body

local optLayout = Instance.new("UIListLayout")
optLayout.FillDirection = Enum.FillDirection.Horizontal
optLayout.Padding       = UDim.new(0, 6)
optLayout.SortOrder     = Enum.SortOrder.LayoutOrder
optLayout.VerticalAlignment = Enum.VerticalAlignment.Center
optLayout.Parent        = optRow

local checkboxes = {}
local function makeOpt(label, key)
    local box = Instance.new("Frame")
    box.Size             = UDim2.new(0, 100, 1, 0)
    box.BackgroundColor3 = C.item
    box.BorderSizePixel  = 0
    box.Parent           = optRow
    Corner(box, 5)
    Stroke(box, C.border)

    local chk = Instance.new("TextButton")
    chk.Size             = UDim2.new(0, 16, 0, 16)
    chk.Position         = UDim2.new(0, 7, 0.5, -8)
    chk.BackgroundColor3 = options[key] and C.accent or C.hover
    chk.Text             = options[key] and "✓" or ""
    chk.TextColor3       = C.white
    chk.Font             = Enum.Font.GothamBold
    chk.TextSize         = 10
    chk.BorderSizePixel  = 0
    chk.Parent           = box
    Corner(chk, 3)

    local lbl = Label(box, label, 11, C.dim, Enum.Font.Gotham)
    lbl.Size     = UDim2.new(1, -28, 1, 0)
    lbl.Position = UDim2.new(0, 26, 0, 0)

    chk.MouseButton1Click:Connect(function()
        options[key] = not options[key]
        chk.BackgroundColor3 = options[key] and C.accent or C.hover
        chk.Text = options[key] and "✓" or ""
    end)
    checkboxes[key] = chk
end

makeOpt("Textures",     "textures")
makeOpt("Meshes",       "meshes")
makeOpt("Transprncy",   "transparency")
makeOpt("Spawns",       "spawns")
makeOpt("Lights",       "lights")
makeOpt("Shadows",      "shadows")

local statusFrame = Instance.new("Frame")
statusFrame.Size             = UDim2.new(1, -20, 0, 40)
statusFrame.Position         = UDim2.new(0, 10, 0, 88)
statusFrame.BackgroundColor3 = C.item
statusFrame.BorderSizePixel  = 0
statusFrame.Parent           = body
Corner(statusFrame, 7)
Stroke(statusFrame, C.border)

local statusDot = Label(statusFrame, "●", 16, C.yellow, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
statusDot.Size     = UDim2.new(0, 36, 1, 0)
statusDot.Position = UDim2.new(0, 0, 0, 0)

local statusLbl = Label(statusFrame, "Ready — configure options above, then click Export Map", 12, C.dim)
statusLbl.Size       = UDim2.new(1, -44, 1, 0)
statusLbl.Position   = UDim2.new(0, 40, 0, 0)
statusLbl.TextWrapped = true

local function setStatus(txt, col, dot)
    statusLbl.Text       = txt
    statusLbl.TextColor3 = col or C.dim
    statusDot.Text       = dot or "●"
    statusDot.TextColor3 = col or C.dim
end

local progBg = Instance.new("Frame")
progBg.Size             = UDim2.new(1, -20, 0, 3)
progBg.Position         = UDim2.new(0, 10, 0, 132)
progBg.BackgroundColor3 = C.item
progBg.BorderSizePixel  = 0
progBg.Parent           = body
Corner(progBg, 2)

local progFill = Instance.new("Frame")
progFill.Size             = UDim2.new(0, 0, 1, 0)
progFill.BackgroundColor3 = C.accent
progFill.BorderSizePixel  = 0
progFill.Parent           = progBg
Corner(progFill, 2)

local function setProgress(pct)
    progFill.Size = UDim2.new(math.clamp(pct, 0, 1), 0, 1, 0)
end

local logFrame = Instance.new("Frame")
logFrame.Size             = UDim2.new(1, -20, 1, -145)
logFrame.Position         = UDim2.new(0, 10, 0, 140)
logFrame.BackgroundColor3 = C.item
logFrame.BorderSizePixel  = 0
logFrame.ClipsDescendants = true
logFrame.Parent           = body
Corner(logFrame, 7)
Stroke(logFrame, C.border)

local logHeader = Instance.new("Frame")
logHeader.Size             = UDim2.new(1, 0, 0, 26)
logHeader.BackgroundColor3 = C.panel
logHeader.BorderSizePixel  = 0
logHeader.Parent           = logFrame

local logTitle = Label(logHeader, "  OUTPUT LOG", 11, C.dim, Enum.Font.GothamMedium)
logTitle.Size = UDim2.new(0.5, 0, 1, 0)

local logCounts = Label(logHeader, "", 11, C.dim, Enum.Font.Code, Enum.TextXAlignment.Right)
logCounts.Size     = UDim2.new(0.5, -10, 1, 0)
logCounts.Position = UDim2.new(0.5, 0, 0, 0)

local scroll = Instance.new("ScrollingFrame")
scroll.Size                  = UDim2.new(1, -2, 1, -28)
scroll.Position              = UDim2.new(0, 1, 0, 27)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel        = 0
scroll.ScrollBarThickness     = 5
scroll.ScrollBarImageColor3   = Color3.fromRGB(55, 55, 70)
scroll.CanvasSize             = UDim2.new(0, 0, 0, 0)
scroll.Parent                 = logFrame

local logLbl = Instance.new("TextLabel")
logLbl.Size               = UDim2.new(1, -14, 0, 0)
logLbl.Position           = UDim2.new(0, 7, 0, 4)
logLbl.BackgroundTransparency = 1
logLbl.TextColor3         = C.logGreen
logLbl.Font               = Enum.Font.Code
logLbl.TextSize           = 12
logLbl.TextXAlignment     = Enum.TextXAlignment.Left
logLbl.TextYAlignment     = Enum.TextYAlignment.Top
logLbl.TextWrapped        = true
logLbl.RichText           = true
logLbl.AutomaticSize      = Enum.AutomaticSize.Y
logLbl.Text               = '<font color="#3cdc82">&gt; DevTools Roblox2HTML v2.0 initialised</font>\n<font color="#6e6e8a">&gt; Configure export options above then press EXPORT MAP</font>'
logLbl.Parent             = scroll

local function log(text, col)
    local hexCol = col and string.format("%02x%02x%02x", math.floor(col.R*255), math.floor(col.G*255), math.floor(col.B*255)) or "3cdc82"
    logLbl.Text = logLbl.Text .. '\n<font color="#' .. hexCol .. '">&gt; ' .. text .. "</font>"
    task.wait()
    local h = logLbl.AbsoluteSize.Y + 12
    scroll.CanvasSize = UDim2.new(0, 0, 0, h)
    scroll.CanvasPosition = Vector2.new(0, h)
end

local function clearLog()
    logLbl.Text = '<font color="#6e6e8a">&gt; Log cleared</font>'
    scroll.CanvasSize = UDim2.new(0, 0, 0, 30)
end

clearBtn.MouseButton1Click:Connect(clearLog)

local function getAssetId(str)
    if not str or str == "" then return nil end
    return str:match("rbxassetid://(%d+)") or str:match("rbxthumb://type=%w+&id=(%d+)") or str:match("^(%d+)$")
end

local function toAssetUrl(id)
    if not id then return nil end
    return "https://assetdelivery.roblox.com/v1/asset/?id=" .. id
end

local function getMeshInfo(obj)
    local info = { meshType = "box" }

    if obj:IsA("Part") then
        local s = obj.Shape
        if s == Enum.PartType.Ball then
            info.meshType = "sphere"
        elseif s == Enum.PartType.Cylinder then
            info.meshType = "cylinder"
        end
    elseif obj:IsA("WedgePart") then
        info.meshType = "wedge"
    elseif obj:IsA("CornerWedgePart") then
        info.meshType = "cornerwedge"
    elseif obj:IsA("MeshPart") then
        info.meshType = "mesh"
        local mid = getAssetId(obj.MeshId)
        if mid then
            info.meshId  = mid
            info.meshUrl = toAssetUrl(mid)
        end
        local tid = getAssetId(obj.TextureID)
        if tid then
            info.textureId  = tid
            info.textureUrl = toAssetUrl(tid)
        end
    end

    local sm = obj:FindFirstChildOfClass("SpecialMesh")
    if sm then
        local mt = sm.MeshType
        if mt == Enum.MeshType.Sphere        then info.meshType = "sphere"
        elseif mt == Enum.MeshType.Cylinder  then info.meshType = "cylinder"
        elseif mt == Enum.MeshType.Wedge     then info.meshType = "wedge"
        elseif mt == Enum.MeshType.Head      then info.meshType = "head"
        elseif mt == Enum.MeshType.FileMesh  then
            local mid = getAssetId(sm.MeshId)
            if mid and mid ~= "" then
                info.meshType = "mesh"
                info.meshId   = mid
                info.meshUrl  = toAssetUrl(mid)
            end
        end
        info.meshScale  = { sm.Scale.X,  sm.Scale.Y,  sm.Scale.Z  }
        info.meshOffset = { sm.Offset.X, sm.Offset.Y, sm.Offset.Z }
        local tid = getAssetId(sm.TextureId)
        if tid and tid ~= "" then
            info.textureId  = tid
            info.textureUrl = toAssetUrl(tid)
        end
    end

    return info
end

local function getTextureInfo(obj)
    local textures = {}

    for _, child in ipairs(obj:GetChildren()) do
        local faceMap = {
            [Enum.NormalId.Top]    = "top",
            [Enum.NormalId.Bottom] = "bottom",
            [Enum.NormalId.Front]  = "front",
            [Enum.NormalId.Back]   = "back",
            [Enum.NormalId.Left]   = "left",
            [Enum.NormalId.Right]  = "right",
        }

        if child:IsA("Texture") or child:IsA("Decal") then
            local tid = getAssetId(child.Texture)
            if tid then
                table.insert(textures, {
                    type  = child.ClassName,
                    face  = faceMap[child.Face] or "front",
                    id    = tid,
                    url   = toAssetUrl(tid),
                    alpha = child.Transparency,
                })
            end

        elseif child:IsA("SurfaceAppearance") then
            local sa = {}
            local function mapSA(prop, key)
                local id = getAssetId(child[prop])
                if id then sa[key] = toAssetUrl(id) end
            end
            mapSA("ColorMap",     "colorMap")
            mapSA("NormalMap",    "normalMap")
            mapSA("RoughnessMap", "roughnessMap")
            mapSA("MetalnessMap", "metalnessMap")
            if next(sa) then textures.surfaceAppearance = sa end
        end
    end

    return textures
end

local function getLightData(obj)
    local lights = {}
    for _, child in ipairs(obj:GetChildren()) do
        if child:IsA("PointLight") or child:IsA("SpotLight") or child:IsA("SurfaceLight") then
            if child.Enabled then
                local entry = {
                    type       = child.ClassName,
                    color      = { child.Color.R, child.Color.G, child.Color.B },
                    brightness = child.Brightness,
                    range      = child.Range,
                }
                if child:IsA("SpotLight") or child:IsA("SurfaceLight") then
                    entry.angle = child.Angle
                    entry.face  = tostring(child.Face)
                end
                table.insert(lights, entry)
            end
        end
    end
    return lights
end

local function buildHTML(mapData, jsonStr)
    local gameName = tostring(mapData.name)
    local partCount = tostring(#mapData.parts)
    local spawnCount = tostring(#mapData.spawns)

    local html = [===[<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DevTools - Roblox2HTML</title>
<style>
  *{margin:0;padding:0;box-sizing:border-box}
  body{overflow:hidden;background:#08080d;font-family:'Segoe UI',system-ui,sans-serif;color:#ddd}
  canvas{display:block}
  #loading{position:fixed;inset:0;background:#08080d;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:16px;z-index:200}
  #loading h1{font-size:24px;font-weight:700;color:#fff;letter-spacing:0.05em}
  #loading p{font-size:13px;color:#888}
  .bar{width:280px;height:3px;background:#1a1a26;border-radius:2px}
  .bar-fill{height:100%;width:0%;background:#3098ff;border-radius:2px;transition:width .15s}
  .badge{position:fixed;z-index:100;background:rgba(8,8,16,.82);backdrop-filter:blur(8px);border:1px solid rgba(255,255,255,.07);border-radius:8px;padding:8px 14px;font-size:12px;line-height:1.7;color:#ccc}
  #info-box{top:12px;left:12px}
  #info-box b{color:#3098ff}
  #pos-box{bottom:12px;right:12px;font-family:'Courier New',monospace;font-size:11px;color:#88a}
  #help-box{bottom:12px;left:12px;font-size:11px;opacity:.7}
  #help-box b{color:#aac}
  #cors-note{display:none;top:12px;right:12px;background:rgba(200,100,0,.18);border-color:rgba(255,140,0,.35);color:#faa}
  #crosshair{position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);pointer-events:none;opacity:0;z-index:50;font-size:20px;color:rgba(255,255,255,.6)}
  #crosshair.active{opacity:1}
</style>
</head>
<body>

<div id="loading">
  <h1> Neo DevTools - Roblox2HTML</h1>
  <p id="load-text">Initialising renderer…</p>
  <div class="bar"><div class="bar-fill" id="load-bar"></div></div>
  <p style="opacity:.4;font-size:11px">Roblox2HTML • ]===] .. partCount .. [===[ parts • ]===] .. spawnCount .. [===[ spawns</p>
</div>

<div class="badge" id="info-box">
  <b>DevTools - Roblox2HTML</b><br>
  Parts: <b>]===] .. partCount .. [===[</b> &nbsp;·&nbsp; Spawns: <b>]===] .. spawnCount .. [===[</b>
</div>
<div class="badge" id="cors-note">⚠ Some textures blocked by CORS.<br>Geometry &amp; colours are fully rendered.</div>
<div class="badge" id="pos-box">Pos: 0.0, 0.0, 0.0</div>
<div class="badge" id="help-box">
  <b>WASD</b> Fly &nbsp;|&nbsp; <b>Space/Ctrl</b> Up/Down &nbsp;|&nbsp;
  <b>Shift</b> Sprint &nbsp;|&nbsp; <b>Scroll</b> Speed &nbsp;|&nbsp; <b>Click</b> Lock mouse
</div>
<div id="crosshair">+</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script>

const MAP = ]===] .. jsonStr .. [===[;

function setLoad(text, pct) {
  const el = document.getElementById('load-text');
  const bar = document.getElementById('load-bar');
  if (el) el.textContent = text;
  if (bar) bar.style.width = (pct * 100) + '%';
}

const scene    = new THREE.Scene();
scene.background = new THREE.Color(0x87CEEB);
scene.fog        = null;

const camera = new THREE.PerspectiveCamera(75, innerWidth / innerHeight, 0.1, 3000);
camera.position.set(0, 10, 30);

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(innerWidth, innerHeight);
renderer.setPixelRatio(Math.min(devicePixelRatio, 2));
renderer.shadowMap.enabled = true;
renderer.shadowMap.type    = THREE.PCFSoftShadowMap;
renderer.physicallyCorrectLights = true;
document.body.appendChild(renderer.domElement);

scene.add(new THREE.AmbientLight(0x404060, 1.0));
const sun = new THREE.DirectionalLight(0xfff8f0, 1.5);
sun.position.set(80, 120, 60);
sun.castShadow = true;
sun.shadow.mapSize.set(2048, 2048);
sun.shadow.camera.left   = sun.shadow.camera.bottom = -300;
sun.shadow.camera.right  = sun.shadow.camera.top    =  300;
sun.shadow.camera.far    = 800;
scene.add(sun);
scene.add(new THREE.HemisphereLight(0x8899cc, 0x443322, 0.5));

// const grid = new THREE.GridHelper(1000, 150, 0x223344, 0x1a1a2a);
// scene.add(grid);

const texLoader = new THREE.TextureLoader();
texLoader.crossOrigin = 'anonymous';
let corsWarned = false;
function loadTex(url, cb) {
  if (!url) return null;
  return texLoader.load(url,
    t => { t.encoding = THREE.sRGBEncoding; if (cb) cb(t); },
    undefined,
    () => {
      if (!corsWarned) {
        corsWarned = true;
        document.getElementById('cors-note').style.display = 'block';
      }
    }
  );
}

function wedgeGeo(sx, sy, sz) {
  const g = new THREE.BufferGeometry();
  const hw = sx/2, hh = sy/2, hd = sz/2;
  const v = [
    -hw,-hh,-hd,  hw,-hh,-hd,  hw,-hh,hd,
    -hw,-hh,-hd,  hw,-hh,hd,  -hw,-hh,hd,
    -hw,-hh,hd,   hw,-hh,hd,   hw,hh,hd,
    -hw,-hh,hd,   hw,hh,hd,  -hw,hh,hd,
    -hw,hh,hd,    hw,hh,hd,    hw,-hh,-hd,
    -hw,hh,hd,    hw,-hh,-hd, -hw,-hh,-hd,
    -hw,-hh,-hd, -hw,-hh,hd,  -hw,hh,hd,
     hw,-hh,-hd,  hw,hh,hd,    hw,-hh,hd,
  ];
  g.setAttribute('position', new THREE.Float32BufferAttribute(v, 3));
  g.computeVertexNormals();
  return g;
}

function cornerWedgeGeo(sx, sy, sz) {
  const g = new THREE.BufferGeometry();
  const hw = sx/2, hh = sy/2, hd = sz/2;
  const v = [
    -hw,-hh,-hd,  hw,-hh,-hd,  hw,-hh,hd,
    -hw,-hh,-hd,  hw,-hh,hd,  -hw,-hh,hd,
    -hw,-hh,hd,   hw,-hh,hd,  -hw,hh,hd,
    -hw,-hh,-hd, -hw,-hh,hd,  -hw,hh,hd,
    -hw,-hh,-hd, -hw,hh,hd,    hw,-hh,-hd,
     hw,-hh,-hd, -hw,hh,hd,    hw,-hh,hd,
  ];
  g.setAttribute('position', new THREE.Float32BufferAttribute(v, 3));
  g.computeVertexNormals();
  return g;
}

function getGeo(part) {
  const sz = part.size;
  const mesh = part.mesh || { meshType: 'box' };
  const ms = (mesh.meshScale) ? mesh.meshScale : [1,1,1];
  switch (mesh.meshType) {
    case 'sphere':
      return new THREE.SphereGeometry(Math.min(...sz) / 2, 20, 14);
    case 'cylinder': {
      const cRadius = Math.min(sz[1], sz[2]) / 2;
      const cGeo = new THREE.CylinderGeometry(cRadius, cRadius, sz[0], 32, 1);
      cGeo.rotateZ(Math.PI / 2);
      return cGeo;
    }
    case 'wedge':
      return wedgeGeo(sz[0]*ms[0], sz[1]*ms[1], sz[2]*ms[2]);
    case 'cornerwedge':
      return cornerWedgeGeo(sz[0]*ms[0], sz[1]*ms[1], sz[2]*ms[2]);
    case 'head':
      return new THREE.SphereGeometry(Math.min(...sz) / 2 * 0.9, 14, 12);
    case 'mesh':
      return new THREE.BoxGeometry(sz[0]*ms[0], sz[1]*ms[1], sz[2]*ms[2]);
    default:
      return new THREE.BoxGeometry(sz[0]*ms[0], sz[1]*ms[1], sz[2]*ms[2]);
  }
}

function getMat(part) {
  const [r, g, b] = part.color;
  const color = new THREE.Color(r, g, b);
  const alpha = 1 - (part.transparency || 0);
  const params = {
    color,
    transparent: alpha < 1,
    opacity: alpha,
    roughness: 0.75,
    metalness: 0.0,
  };

  const mat = (part.material || '').toLowerCase();
  if (mat.includes('metal') || mat.includes('corroded')) { params.roughness = 0.35; params.metalness = 0.85; }
  else if (mat.includes('glass'))   { params.roughness = 0.05; params.transparent = true; params.opacity = Math.max(0.15, alpha); }
  else if (mat.includes('neon'))    { params.emissive = color; params.emissiveIntensity = 1.2; params.roughness = 0.1; }
  else if (mat.includes('wood'))    { params.roughness = 0.95; }
  else if (mat.includes('marble'))  { params.roughness = 0.2; params.metalness = 0.05; }
  else if (mat.includes('smooth'))  { params.roughness = 0.25; }
  else if (mat.includes('concrete'))  { params.roughness = 1.0; }
  else if (mat.includes('sand') || mat.includes('grass') || mat.includes('mud')) { params.roughness = 1.0; }
  else if (mat.includes('ice'))     { params.roughness = 0.05; params.metalness = 0.1; params.transparent = true; params.opacity = Math.max(0.6, alpha); }
  else if (mat.includes('foil'))    { params.roughness = 0.1;  params.metalness = 0.9; }
  else if (mat.includes('fabric'))  { params.roughness = 1.0; }

  const sa = part.textures && part.textures.surfaceAppearance;
  if (sa) {
    const m = new THREE.MeshStandardMaterial(params);
    if (sa.colorMap)     loadTex(sa.colorMap,     t => { m.map = t; m.needsUpdate = true; });
    if (sa.normalMap)    loadTex(sa.normalMap,     t => { m.normalMap = t; m.needsUpdate = true; });
    if (sa.roughnessMap) loadTex(sa.roughnessMap,  t => { m.roughnessMap = t; m.needsUpdate = true; });
    if (sa.metalnessMap) loadTex(sa.metalnessMap,  t => { m.metalnessMap = t; m.needsUpdate = true; });
    return m;
  }

  if (part.mesh && part.mesh.textureUrl) {
    const m = new THREE.MeshStandardMaterial(params);
    loadTex(part.mesh.textureUrl, t => { m.map = t; m.needsUpdate = true; });
    return m;
  }

  if (part.textures && part.textures.length > 0 && part.textures[0].url) {
    const m = new THREE.MeshStandardMaterial(params);
    loadTex(part.textures[0].url, t => { m.map = t; m.needsUpdate = true; });
    return m;
  }

  return new THREE.MeshStandardMaterial(params);
}

function addLights(part) {
  if (!part.lights || part.lights.length === 0) return;
  part.lights.forEach(ld => {
    const col = new THREE.Color(ld.color[0], ld.color[1], ld.color[2]);
    const intensity = ld.brightness * 0.6;
    let light;
    if (ld.type === 'PointLight') {
      light = new THREE.PointLight(col, intensity, ld.range || 30);
    } else if (ld.type === 'SpotLight') {
      light = new THREE.SpotLight(col, intensity, ld.range || 30, ((ld.angle || 45) * Math.PI) / 180, 0.25);
    } else {
      light = new THREE.PointLight(col, intensity * 0.5, ld.range || 20);
    }
    light.position.set(...part.position);
    scene.add(light);
  });
}

async function buildScene() {
  setLoad('Building geometry…', 0.05);
  const BATCH = 150;

  for (let i = 0; i < MAP.parts.length; i++) {
    if (i % BATCH === 0) {
      setLoad(`Building geometry… ${i} / ${MAP.parts.length}`, 0.05 + (i / MAP.parts.length) * 0.85);
      await new Promise(r => setTimeout(r, 0));
    }
    const part = MAP.parts[i];
    try {
      const geo  = getGeo(part);
      const mat  = getMat(part);
      const mesh = new THREE.Mesh(geo, mat);

      mesh.position.set(...part.position);
      mesh.rotation.order = 'YXZ';
      mesh.rotation.x = part.rotation[0] * Math.PI / 180;
      mesh.rotation.y = part.rotation[1] * Math.PI / 180;
      mesh.rotation.z = part.rotation[2] * Math.PI / 180;
      mesh.castShadow    = part.castShadow !== false && (part.transparency || 0) < 0.7;
      mesh.receiveShadow = true;

      scene.add(mesh);
      addLights(part);
    } catch (e) {
      console.warn('Part error:', part.name, e);
    }
  }

  if (MAP.spawns) {
    MAP.spawns.forEach(sp => {
      const disc = new THREE.Mesh(
        new THREE.CylinderGeometry(2.5, 2.5, 0.15, 20),
        new THREE.MeshStandardMaterial({ color: 0x00ff88, emissive: 0x004422, roughness: 0.3, transparent: true, opacity: 0.75 })
      );
      disc.position.set(sp[0], sp[1], sp[2]);
      scene.add(disc);

      const beam = new THREE.Mesh(
        new THREE.CylinderGeometry(0.08, 0.5, 10, 8),
        new THREE.MeshStandardMaterial({ color: 0x00ff88, emissive: 0x00ff44, transparent: true, opacity: 0.1 })
      );
      beam.position.set(sp[0], sp[1] + 5, sp[2]);
      scene.add(beam);
    });
  }

  if (MAP.spawns && MAP.spawns.length > 0) {
    const s = MAP.spawns[0];
    camera.position.set(s[0], s[1] + 10, s[2] + 20);
  } else if (MAP.parts.length > 0) {
    let cx = 0, cy = 0, cz = 0;
    const n = Math.min(MAP.parts.length, 200);
    for (let i = 0; i < n; i++) {
      cx += MAP.parts[i].position[0];
      cy += MAP.parts[i].position[1];
      cz += MAP.parts[i].position[2];
    }
    camera.position.set(cx/n, cy/n + 25, cz/n + 50);
  }

  setLoad('Ready!', 1);
  await new Promise(r => setTimeout(r, 400));
  document.getElementById('loading').style.display = 'none';
}

let yaw = 0, pitch = 0, locked = false;
const keys = {};
let flySpeed = 20;

renderer.domElement.addEventListener('click', () => {
  renderer.domElement.requestPointerLock();
});
document.addEventListener('pointerlockchange', () => {
  locked = document.pointerLockElement === renderer.domElement;
  document.getElementById('crosshair').classList.toggle('active', locked);
});
document.addEventListener('mousemove', e => {
  if (!locked) return;
  yaw   -= e.movementX * 0.0018;
  pitch  = Math.max(-Math.PI/2 + 0.01, Math.min(Math.PI/2 - 0.01, pitch - e.movementY * 0.0018));
  camera.rotation.order = 'YXZ';
  camera.rotation.y = yaw;
  camera.rotation.x = pitch;
});
document.addEventListener('keydown',  e => { keys[e.code] = true;  e.preventDefault && ['Space','ControlLeft','ArrowUp','ArrowDown'].includes(e.code) && e.preventDefault(); });
document.addEventListener('keyup',    e => { keys[e.code] = false; });
renderer.domElement.addEventListener('wheel', e => {
  flySpeed = Math.max(2, Math.min(800, flySpeed + (e.deltaY < 0 ? 4 : -4)));
});

const clock = new THREE.Clock();
function animate() {
  requestAnimationFrame(animate);
  const dt = Math.min(clock.getDelta(), 0.05);

  if (locked) {
    const spd = (keys['ShiftLeft'] || keys['ShiftRight']) ? flySpeed * 4 : flySpeed;
    const horiz = new THREE.Vector3(
      (keys['KeyD'] ? 1 : 0) - (keys['KeyA'] ? 1 : 0), 0,
      (keys['KeyS'] ? 1 : 0) - (keys['KeyW'] ? 1 : 0)
    );
    if (horiz.lengthSq() > 0) {
      horiz.normalize().applyQuaternion(camera.quaternion);
      horiz.y = 0;
    }
    camera.position.addScaledVector(horiz, spd * dt * 10);
    camera.position.y += ((keys['Space'] ? 1 : 0) - (keys['ControlLeft'] ? 1 : 0)) * spd * dt * 10;
  }

  const p = camera.position;
  document.getElementById('pos-box').textContent =
    `${p.x.toFixed(1)}, ${p.y.toFixed(1)}, ${p.z.toFixed(1)}  |  spd: ${flySpeed.toFixed(0)}  |  ${locked ? 'ESC to unlock' : 'click to lock'}`;

  renderer.render(scene, camera);
}

window.addEventListener('resize', () => {
  camera.aspect = innerWidth / innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(innerWidth, innerHeight);
});

buildScene().then(animate);
</script>
</body>
</html>]===]

    return html
end

local generatedHTML = ""
local generatedJSON = ""

local function copyToClipboard(text, label)
    local ok = pcall(setclipboard, text)
    if ok then
        setStatus("✅  " .. label .. " copied to clipboard — paste into a .html or .json file", C.green, "●")
        log(label .. " copied — " .. math.floor(#text/1024) .. " KB", C.logGreen)
    else
        setStatus("⚠  setclipboard unavailable — see log output below", C.yellow, "◌")
        log("Clipboard unavailable. First 400 chars:", C.yellow)
        log(string.sub(text, 1, 400) .. "…", C.dim)
    end
end

exportBtn.MouseButton1Click:Connect(function()
    if exportBtn.BackgroundColor3 == Color3.fromRGB(12, 70, 30) then return end
    exportBtn.BackgroundColor3 = Color3.fromRGB(12, 70, 30)
    setProgress(0)
    setStatus("Scanning workspace…", C.yellow, "◌")
    log("── Export started ──", C.accent)
    task.wait()

    local mapData = {
        name   = tostring(game.Name),
        parts  = {},
        spawns = {},
    }

    local skip = {}
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p.Character then
            for _, d in ipairs(p.Character:GetDescendants()) do skip[d] = true end
        end
    end

    local all    = workspace:GetDescendants()
    local total  = #all
    local counts = { parts=0, meshes=0, textures=0, lights=0, skipped=0 }

    log("Workspace descendants: " .. total, C.dim)
    task.wait()

    for i, obj in ipairs(all) do
        if i % 300 == 0 then
            setProgress(i / total * 0.70)
            setStatus(string.format("Scanning… %d/%d  (%d parts found)", i, total, counts.parts), C.yellow, "◌")
            task.wait()
        end

        if obj:IsA("BasePart") and not skip[obj] then

            if obj:IsA("SpawnLocation") then
                counts.skipped = counts.skipped + 1
            end

            if obj:IsA("Terrain") then
                counts.skipped += 1
                continue
            end

            local lname = tostring(obj.Name):lower()
            if lname == "baseplate" or lname == "base plate" or lname == "base_plate"
               or lname == "base" or lname == "ground" or lname == "floor_base" then
                counts.skipped = counts.skipped + 1
            end

            local psx, psy, psz = obj.Size.X, obj.Size.Y, obj.Size.Z
            if obj.Anchored and psy <= 5 and psx >= 150 and psz >= 150 then
                counts.skipped = counts.skipped + 1
            end

            if obj.Transparency >= 1 and not options.transparency then
                counts.skipped = counts.skipped + 1
            end

            local r, g, b = 0.5, 0.5, 0.5
            pcall(function()
                r = obj.Color.R; g = obj.Color.G; b = obj.Color.B
            end)

            local pd = {
                name         = tostring(obj.Name),
                class        = tostring(obj.ClassName),
                position     = { obj.Position.X,   obj.Position.Y,   obj.Position.Z   },
                size         = { obj.Size.X,        obj.Size.Y,       obj.Size.Z       },
                color        = { r, g, b },
                rotation     = { obj.Orientation.X, obj.Orientation.Y, obj.Orientation.Z },
                transparency = obj.Transparency,
                castShadow   = options.shadows and obj.CastShadow,
                material     = tostring(obj.Material),
            }

            if options.meshes then
                pd.mesh = getMeshInfo(obj)
                if pd.mesh.meshType ~= "box" then counts.meshes = counts.meshes + 1 end
            else
                pd.mesh = { meshType = "box" }
            end

            if options.textures then
                local ti = getTextureInfo(obj)
                if #ti > 0 or ti.surfaceAppearance then
                    pd.textures = ti
                    counts.textures = counts.textures + 1
                end
            end

            if options.lights then
                local li = getLightData(obj)
                if #li > 0 then
                    pd.lights = li
                    counts.lights = counts.lights + 1
                end
            end

            table.insert(mapData.parts, pd)
            counts.parts = counts.parts + 1
        end

    end

    if options.spawns then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("SpawnLocation") or
               (obj:IsA("BasePart") and tostring(obj.Name):lower():find("spawn")) then
                table.insert(mapData.spawns, { obj.Position.X, obj.Position.Y, obj.Position.Z })
            end
        end
    end

    log(string.format("Collected  parts:%d  meshes:%d  textures:%d  lights:%d  spawns:%d  skipped:%d",
        counts.parts, counts.meshes, counts.textures, counts.lights, #mapData.spawns, counts.skipped), C.logGreen)

    setProgress(0.75)
    setStatus("Encoding JSON…", C.yellow, "◌")
    task.wait()

    local ok, result = pcall(function() return HttpSvc:JSONEncode(mapData) end)
    if not ok then
        setStatus("❌  JSON encoding failed — map may be too large", C.red, "✕")
        log("ERROR: " .. tostring(result), C.red)
        exportBtn.BackgroundColor3 = Color3.fromRGB(25, 130, 65)
        return
    end
    generatedJSON = result

    setProgress(0.88)
    setStatus("Building HTML viewer…", C.yellow, "◌")
    log("JSON size: " .. math.floor(#generatedJSON/1024) .. " KB", C.dim)
    task.wait()

    generatedHTML = buildHTML(mapData, generatedJSON)

    logCounts.Text = string.format("parts: %d  |  html: %d KB  |  json: %d KB",
        counts.parts, math.floor(#generatedHTML/1024), math.floor(#generatedJSON/1024))

    setProgress(1)
    setStatus(string.format("✅  Export done — %d parts · HTML %d KB · JSON %d KB",
        counts.parts, math.floor(#generatedHTML/1024), math.floor(#generatedJSON/1024)), C.green, "●")
    log("── Export complete ──", C.accent)
    exportBtn.BackgroundColor3 = Color3.fromRGB(25, 130, 65)
end)

copyHTMLBtn.MouseButton1Click:Connect(function()
    if generatedHTML ~= "" then
        copyToClipboard(generatedHTML, "HTML")
    else
        setStatus("⚠  Run Export first!", C.yellow, "◌")
    end
end)

copyJSONBtn.MouseButton1Click:Connect(function()
    if generatedJSON ~= "" then
        copyToClipboard(generatedJSON, "JSON")
    else
        setStatus("⚠  Run Export first!", C.yellow, "◌")
    end
end)

log("Script loaded — executor: " .. (identifyexecutor and identifyexecutor() or "unknown"), C.dim)
print("[DevTools R2H] GUI loaded successfully")
