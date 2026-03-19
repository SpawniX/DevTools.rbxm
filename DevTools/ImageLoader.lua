--[[
	Seph's ImageLoader :3
	version 1.5.0
	latest update: added gif support
]]

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local URL = "https://zenyru.vercel.app/api/image-to-array"

local function create_tool(width, height, toolscale)
	local tool = Instance.new("Tool")
	tool.RequiresHandle = true
	local ratio = width / height
	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(toolscale * ratio, toolscale, 0.1)
	handle.Color = Color3.new(0, 0, 0)
	handle.Massless = true
	handle.CanQuery, handle.CanTouch, handle.CanCollide = false, true, false
	handle.Material = Enum.Material.SmoothPlastic
	handle.Parent = tool
	return tool, handle
end

return function(url, owner, res, threshold, toolscale, fps, asgif)
	fps = fps or 24
	asgif = asgif ~= false

	if typeof(owner) == "string" then
		owner = Players:FindFirstChild(owner)
		if not owner then
			print("could not find owner, using first player found")
			owner = Players:FindFirstChildWhichIsA("Player") or Players.PlayerAdded:Wait()
		end
	end

	local body = {
		url = url,
		size = res,
		persent = threshold,
		animated = asgif,
		fps = fps
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = URL,
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode(body)
		})
	end)

	if success and response.StatusCode == 200 then
		local data = HttpService:JSONDecode(response.Body)
		if data.status == "success" then
			local animated = asgif and data.dimensions.animated
			local pixels = animated and data.pixels or data.pixels

			local tool, handle = create_tool(data.dimensions.width, data.dimensions.height, toolscale)
			tool.Name = `Generated_Image_{math.random(1, 10000)}`
			tool.GripPos = Vector3.new(0, -handle.Size.Y / 2 + 1, 0)

			local client = require(123068958552495)({
				source = [[
local imagerender = script.Parent:WaitForChild("ImageRender")
local handle, pixels, width, height, fps, animated, durations = imagerender:InvokeServer()

local partwidth = handle.Size.X
local partheight = handle.Size.Y
local spanw = partwidth / width
local spanh = partheight / height
local halfw = partwidth / 2
local halfh = partheight / 2
local zoffset = -0.051
local subdivisions = math.max(1, math.ceil(spanh / 0.01))

local budget = 1/15

local t_create = table.create
local v3 = Vector3.new
local c3 = Color3.fromRGB
local b_create = buffer.create
local b_copy = buffer.copy
local b_writef32 = buffer.writef32
local b_readf32 = buffer.readf32
local os_clock = os.clock
local task_wait = task.wait

local xcoords = t_create(width + 1)
for col = 0, width do
	xcoords[col + 1] = halfw - col * spanw
end

local allycenters = t_create(height)
for y = 1, height do
	local ycenters = t_create(subdivisions)
	for sub = 1, subdivisions do
		ycenters[sub] = halfh - (y - 1 + (sub - 0.5) / subdivisions) * spanh
	end
	allycenters[y] = ycenters
end

local function buildwire(framepixels)
	local wire = Instance.new("WireframeHandleAdornment")
	wire.Adornee = handle
	wire.AlwaysOnTop = false
	wire.Visible = false
	wire.Parent = handle

	local colorbuckets = {}
	local lastyield = os_clock()

	for y, rows in framepixels do
		local now = os_clock()
		if now - lastyield >= budget then
			task_wait()
			lastyield = os_clock()
		end

		local ycenters = allycenters[y]
		local currentx = 0

		for _, span in rows do
			local spanlen = span[1]
			local r, g, b = span[2], span[3], span[4]
			local key = r * 65536 + g * 256 + b

			local bucket = colorbuckets[key]
			if not bucket then
				bucket = {
					color = c3(r, g, b),
					buf = b_create(2048),
					count = 0,
					capacity = 128
				}
				colorbuckets[key] = bucket
			end

			local required = bucket.count + subdivisions
			if required > bucket.capacity then
				local newcap = bucket.capacity * 2
				while required > newcap do
					newcap *= 2
				end
				local newbuf = b_create(newcap * 16)
				b_copy(newbuf, 0, bucket.buf, 0, bucket.count * 16)
				bucket.buf = newbuf
				bucket.capacity = newcap
			end

			local offset = bucket.count * 16
			local x1 = xcoords[currentx + 1]
			local x2 = xcoords[currentx + spanlen + 1]
			local buf = bucket.buf

			for i = 1, subdivisions do
				local yc = ycenters[i]
				b_writef32(buf, offset,      x1)
				b_writef32(buf, offset + 4,  yc)
				b_writef32(buf, offset + 8,  x2)
				b_writef32(buf, offset + 12, yc)
				offset += 16
			end

			bucket.count = required
			currentx += spanlen
		end
	end

	for _, bucket in colorbuckets do
		local count = bucket.count
		local points = t_create(count * 2)
		local buf = bucket.buf

		for i = 0, count - 1 do
			local offset = i * 16
			local x1 = b_readf32(buf, offset)
			local yc = b_readf32(buf, offset + 4)
			local x2 = b_readf32(buf, offset + 8)

			local idx = i * 2
			points[idx + 1] = v3(x1, yc, zoffset)
			points[idx + 2] = v3(x2, yc, zoffset)
		end

		wire.Color3 = bucket.color
		wire:AddLines(points)
	end

	return wire
end

if animated then
	local allwires = t_create(#pixels)
	for i, frame in pixels do
		allwires[i] = buildwire(frame)
	end

	local frame = 1
	allwires[1].Visible = true
	while true do
		local delay = (durations and durations[frame]) or (1 / fps)
		task_wait(delay)
		local nextframe = frame % #allwires + 1
		allwires[nextframe].Visible = true
		allwires[frame].Visible = false
		frame = nextframe
	end
else
	local wire = buildwire(pixels)
	wire.Visible = true
end
]],
				type = "Script",
				runcontext = Enum.RunContext.Client
			})
			tool.Parent = owner.Backpack

			local ImageRender = Instance.new("RemoteFunction")
			ImageRender.Name = "ImageRender"
			ImageRender.Parent = tool
			ImageRender.OnServerInvoke = function()
				return handle, pixels, data.dimensions.width, data.dimensions.height, fps, animated, data.dimensions.durations
			end

			client.Enabled = false
			client.Parent = tool
			task.wait(0.25)
			client.Enabled = true
		end
	else
		warn("something bad happened", response)
	end
end
