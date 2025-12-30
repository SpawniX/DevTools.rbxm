local RunService = game:GetService("RunService")
local function hash32(x)
	x = ((x >> 16) ~ x) * 0x45d9f3b
	x = ((x >> 16) ~ x) * 0x45d9f3b
	x = (x >> 16) ~ x
	return x & 0xFFFFFFFF
end
RunService.Heartbeat:Wait()
local t1 = os.clock() * 1e9
local t2 = tick() * 1e6
local mem = tonumber(string.sub(tostring({}), 8), 16) or 0
local seed = hash32(t1 ~ t2 ~ mem)
local rng = Random.new(seed)

return rng:NextInteger(-100, 100)
