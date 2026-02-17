--[[
	Groovys image loader
	
	thurr durr https://req-exe.win/
	
]]

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local URL = "http://req-exe.win/api/image-to-array"

local function are_colors_equal(c1, c2)
	if not c1 or not c2 then return false end
	return c1[1] == c2[1] and c1[2] == c2[2] and c1[3] == c2[3]
end


local function render_batch(gui, spans, total_span_width, y_index, start_x_index, scale_w, scale_h)
	local f = Instance.new("Frame")
	f.Name = "not important" 
	f.BorderSizePixel = 0
	f.BackgroundColor3 = Color3.new(1, 1, 1)

	f.Position = UDim2.fromScale((start_x_index - 1) * scale_w, (y_index - 1) * scale_h)
	f.Size = UDim2.fromScale(total_span_width * scale_w, scale_h)

	local gradient = Instance.new("UIGradient")
	local keypoints = {}

	local current_pos = 0

	for i, span in spans do
		local color = Color3.fromRGB(span[2], span[3], span[4])
		local span_len = span[1]
		local start_ratio = current_pos / total_span_width
		local end_ratio = (current_pos + span_len) / total_span_width

		start_ratio = math.clamp(start_ratio, 0, 1)
		end_ratio = math.clamp(end_ratio, 0, 1)

		table.insert(keypoints, ColorSequenceKeypoint.new(start_ratio, color))


		if i < #spans then
			local next_start = end_ratio + 0.001
			if next_start > 1 then next_start = 1 end
			table.insert(keypoints, ColorSequenceKeypoint.new(end_ratio, color))
		else
			table.insert(keypoints, ColorSequenceKeypoint.new(end_ratio, color))
		end

		current_pos += span_len
	end
	
	local success = pcall(function()
		gradient.Color = ColorSequence.new(keypoints)
	end)

	if success then
		gradient.Parent = f
		f.Parent = gui
	else
		f.BackgroundColor3 = Color3.fromRGB(spans[1][2], spans[1][3], spans[1][4])
		gradient:Destroy()
		f.Parent = gui
	end
end

local function create_tool(data, width, height, res, threshold, toolscale)
	local tool = Instance.new("Tool")
	tool.RequiresHandle = true

	local ratio = width / height
	local partheight = toolscale
	local partwidth = toolscale * ratio

	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(partwidth, partheight, 0.1)
	handle.Color = Color3.new(0,0,0)
	handle.Massless = true
	handle.Parent = tool

	local gui = Instance.new("SurfaceGui")
	gui.Face = Enum.NormalId.Front
	gui.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
	gui.CanvasSize = Vector2.new(width * 10, height * 10)
	gui.Parent = handle

	local scalehight = 1 / height
	local scalewidth = 1 / width

	for y, rows in data do
		local batch_spans = {}
		local batch_pixel_width = 0
		local batch_start_x = 1
		local current_x = 1

		for _, span in rows do
			local span_len = span[1]

			table.insert(batch_spans, span)
			batch_pixel_width += span_len

			if #batch_spans >= 10 then
				render_batch(gui, batch_spans, batch_pixel_width, y, batch_start_x, scalewidth, scalehight)

				batch_start_x = current_x + span_len
				batch_spans = {}
				batch_pixel_width = 0
			end

			current_x += span_len
		end

		if #batch_spans > 0 then
			render_batch(gui, batch_spans, batch_pixel_width, y, batch_start_x, scalewidth, scalehight)
		end
	end

	return tool
end

-- if y % 50 == 0 then task.wait() end


return function (url, owner, res, threshold, toolscale, putinsg)
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
		persent = threshold
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
			local tool = create_tool(data.pixels, data.dimensions.width, data.dimensions.height, res, threshold, toolscale)
			tool.Name = `Generated_Image_{math.random(1,10000)}`
			if owner:FindFirstChild("StarterGear") and putinsg then
				tool:Clone().Parent = owner.StarterGear
			end
			tool.Parent = owner.Backpack
		end
	else
		warn("something bad happened", response)
	end
end
