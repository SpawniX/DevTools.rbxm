print("Made by SP4WN'ED")
local v1 = debug
getgenv().debug = nil
debug = {}
function debug.getinfo(p2)
    return p2 and {
        source = "=(mock function source)",
        short_src = "mock_func.lua",
        linedefined = 2,
        lastlinedefined = 4,
        what = "Lua",
        name = "mock_function",
        currentline = 3
    } or {
        source = "=(mock source)",
        short_src = "mock.lua",
        linedefined = 1,
        lastlinedefined = 1,
        what = "main",
        name = "main",
        currentline = 10
    }
end
local v3, v4, v5 = pairs(v1)
while true do
    local v6, v7 = v3(v4, v5)
    if v6 == nil then
        break
    end
    v5 = v6
    if v6 ~= "getinfo" then
        debug[v6] = v7
    end
end
local vu11 = (function(pu8)
    local v9, v10 = pcall(function()
        return game:HttpGet(pu8)
    end)
    if v9 then
        return loadstring(v10)()
    else
        return nil
    end
end)("https://raw.githubusercontent.com/notpoiu/Scripts/main/utils/console/main.lua") or (getgenv().console_utils or {
    custom_print = print,
    custom_console_progressbar = function(_)
        return {
            update_message = function()
            end,
            update_progress = function()
            end,
            cleanup = function()
            end
        }
    end
})
local vu12 = toclipboard or setclipboard
local vu13 = {
    Colors = {
        Red = "255,0,0",
        Green = "0,255,0",
        Blue = "0,122,255",
        Purple = "170,0,255",
        Cyan = "33,161,163",
        Orange = "255,165,0",
        Yellow = "255,255,0",
        White = "255,255,255",
        Gray = "128,128,128"
    }
}
local function vu23(p14, p15, p16)
    local v17 = p16 or 14
    local v18 = vu13.Colors[p14]
    if v18 then
        local v19, v20, v21 = v18:match("(%d+),(%d+),(%d+)")
        if v19 and (v20 and v21) then
            local v22 = string.format("<font color=\"rgb(%s)\" size=\"%d\">%s</font>", v18, v17, tostring(p15))
            if vu11 and vu11.custom_print then
                vu11.custom_print({
                    message = p15,
                    color = Color3.fromRGB(tonumber(v19), tonumber(v20), tonumber(v21))
                })
            else
                print(v22)
            end
        else
            warn("Invalid RGB format for color: " .. tostring(p14))
        end
    else
        warn("Invalid color: " .. tostring(p14))
        return
    end
end
local function vu25()
    local v24 = getgenv()
    v24.islclosure = nil
    v24.isexecutorclosure = nil
    v24.isfunctionhooked = nil
    v24.isourclosure = nil
end
local vu26 = {}
local vu27 = 0
local function vu39(p28, p29)
    if type(p28) ~= "table" then
        return tostring(p28)
    end
    local v30 = p29 or 0
    local v31 = string.rep("  ", v30)
    local v32, v33, v34 = pairs(p28)
    local v35 = "{\n"
    while true do
        local v36
        v34, v36 = v32(v33, v34)
        if v34 == nil then
            break
        end
        local v37 = v35 .. v31 .. "  " .. tostring(v34) .. ": "
        local v38
        if type(v36) ~= "table" then
            v38 = v37 .. tostring(v36)
        else
            v38 = v37 .. vu39(v36, v30 + 1)
        end
        v35 = v38 .. "\n"
    end
    return v35 .. v31 .. "}"
end
local function vu77(p40, pu41, p42, p43)
    local v44 = (os.clock() - p42) * 1000
    vu27 = vu27 + 1
    local v45 = string.format("%03d", vu27)
    local v46 = vu11.custom_console_progressbar({
        msg = string.format("%s Request: %s", p43 and "HttpGet" or "HTTP", p40.Url or "N/A"),
        color = Color3.fromRGB(33, 161, 163)
    })
    v46.update_progress(25)
    local v47 = {
        timestamp = os.date("%Y-%m-%d %H:%M:%S"),
        requestId = v45,
        duration = v44,
        request = {
            method = p40.Method or "GET",
            url = p40.Url,
            headers = p40.Headers or {},
            body = p40.Body or p40.Data
        },
        response = pu41
    }
    vu26[v45] = {
        formatted = game:GetService("HttpService"):JSONEncode(v47),
        timestamp = os.date("%H:%M:%S")
    }
    v46.update_progress(50)
    vu23("Blue", string.rep("\239\191\189\239\191\189", 65), 16)
    vu23("Purple", "\239\191\189\239\191\189 " .. (p43 and "HttpGet" or "HTTP") .. " Request #" .. v45 .. " \226\154\161  [" .. os.date("%H:%M:%S") .. "]", 16)
    vu23("Blue", string.rep("\239\191\189\239\191\189", 65), 16)
    vu23("Cyan", "\239\191\189\239\191\189 Basic Info:", 15)
    vu23("Orange", "  \226\128\162 Method: " .. (p40.Method or "GET"))
    vu23("Orange", "  \226\128\162 URL: " .. (p40.Url or "N/A"))
    vu23("Orange", string.format("  \226\128\162 Duration: %.2f ms", v44))
    v46.update_progress(75)
    if p40.Headers then
        vu23("Cyan", "\n\226\158\164 Request Headers:", 15)
        local v48, v49, v50 = pairs(p40.Headers)
        while true do
            local v51
            v50, v51 = v48(v49, v50)
            if v50 == nil then
                break
            end
            vu23("Green", "  \226\128\162 " .. v50 .. ": " .. tostring(v51))
        end
    end
    local v52 = p40.Body or p40.Data
    if v52 then
        vu23("Cyan", "\n\226\158\164 Request Body:", 15)
        if type(v52) ~= "table" then
            local v53 = tostring(v52)
            local v54 = 80
            for v55 = 1, # v53, v54 do
                vu23("Green", "  " .. v53:sub(v55, v55 + v54 - 1))
            end
        else
            local v56, v57, v58 = string.gmatch(vu39(v52, 1), "[^\n]+")
            while true do
                v58 = v56(v57, v58)
                if v58 == nil then
                    break
                end
                vu23("Green", "  " .. v58)
            end
        end
    end
    if pu41 then
        vu23("Cyan", "\n\226\158\164 Response:", 15)
        local function vu67(pu59)
            if not pu59 or type(pu59) ~= "string" then
                return nil
            end
            local v61, v62, v63 = ipairs({
                function()
                    return game:GetService("HttpService"):JSONDecode(pu59)
                end,
                function()
                    pu59 = pu59:gsub("^%s+", ""):gsub("%s+$", "")
                    return game:GetService("HttpService"):JSONDecode(pu59)
                end,
                function()
                    local v60 = pu59:gsub("\\\"", "\"")
                    return game:GetService("HttpService"):JSONDecode(v60)
                end
            })
            while true do
                local v64
                v63, v64 = v61(v62, v63)
                if v63 == nil then
                    break
                end
                local v65, v66 = pcall(v64)
                if v65 and type(v66) == "table" then
                    return v66
                end
            end
            return nil
        end
        local v68, v69 = pcall(function()
            return vu67(pu41)
        end)
        if v68 and type(v69) == "table" then
            vu23("Yellow", "  [Decoded JSON Response]")
            local v70, v71, v72 = string.gmatch(vu39(v69, 1), "[^\n]+")
            while true do
                v72 = v70(v71, v72)
                if v72 == nil then
                    break
                end
                vu23("Green", "  " .. v72)
            end
        else
            vu23("Yellow", "  [Raw Response - JSON Decode Failed]")
            local v73 = tostring(pu41)
            local v74 = # v73
            if v74 > 2000 then
                local v75 = v73:sub(1, 1000)
                local v76 = v73:sub(v74 - 999, v74)
                vu23("Green", "  " .. v75)
                vu23("Gray", "  ... [truncated] ...")
                vu23("Green", "  " .. v76)
            else
                vu23("Green", "  " .. v73)
            end
        end
    end
    v46.update_progress(100)
    v46.cleanup()
    vu23("Blue", string.rep("\239\191\189\239\191\189", 65), 16)
end
local function vu93(pu78)
    if type(pu78) ~= "string" then
        return "Invalid JSON input"
    end
    local v79, v80 = pcall(function()
        return game:GetService("HttpService"):JSONDecode(pu78)
    end)
    if not v79 then
        return "Invalid JSON format: " .. tostring(v80)
    end
    local function vu92(p81, p82)
        local v83 = p82 or 0
        local v84 = string.rep("  ", v83)
        local v85, v86, v87 = pairs(p81)
        local v88 = "{\n"
        while true do
            local v89
            v87, v89 = v85(v86, v87)
            if v87 == nil then
                break
            end
            local v90 = type(v87) == "string" and "\"" .. v87 .. "\"" or tostring(v87)
            local v91
            if type(v89) ~= "table" then
                if type(v89) ~= "string" then
                    if type(v89) ~= "boolean" then
                        if type(v89) ~= "number" then
                            v91 = "\"" .. tostring(v89) .. "\""
                        else
                            v91 = tostring(v89)
                        end
                    else
                        v91 = tostring(v89)
                    end
                else
                    v91 = "\"" .. v89:gsub("\"", "\\\"") .. "\""
                end
            else
                v91 = vu92(v89, v83 + 1)
            end
            v88 = v88 .. v84 .. "  " .. v90 .. ": " .. v91 .. ",\n"
        end
        return v88:sub(1, - 3) .. "\n" .. v84 .. "}"
    end
    return vu92(v80)
end
local function v97(p94)
    local v95 = vu26[p94]
    if v95 then
        local v96 = string.format("http_spy_request_%s_%s.json", p94, os.date("%Y%m%d_%H%M%S"))
        if writefile then
            writefile("HttpSpyVenox/" .. v96, (vu93(v95.formatted)))
            vu23("Green", "\239\191\189\239\191\189 Request " .. p94 .. " saved to " .. v96)
        else
            vu23("Red", "X writefile function not available!")
        end
    else
        vu23("Red", "X request not found!")
    end
end
local function v100(p98)
    local v99 = vu26[p98]
    if v99 then
        if vu12 then
            vu12(vu93(v99.formatted))
            vu23("Green", "\239\191\189\239\191\189 Request " .. p98 .. " copied to clipboard!")
        else
            vu23("Red", "X toclipboard function not available!")
        end
    else
        vu23("Red", "X request not found!")
    end
end
local function v125()
    vu25()

    local raw_request =
        getgenv().request
        or getgenv().http_request
        or (syn and syn.request)
        or (fluxus and fluxus.request)

    if type(raw_request) ~= "function" then
        warn("No request function found, HTTP Spy disabled")
        return
    end

    local in_hook = false

    local function wrapped_request(req)
        if in_hook then
            return raw_request(req)
        end

        in_hook = true

        local start = os.clock()
        local realReq = type(req) == "table" and req or {
            Url = tostring(req),
            Method = "GET"
        }

        local ok, resp = pcall(raw_request, realReq)
        in_hook = false

        if ok then
            vu77(realReq, resp, start, false)
            return resp
        else
            warn("Request error:", resp)
            return nil
        end
    end
    getgenv().request = wrapped_request
    getgenv().httprequest = wrapped_request
    getgenv().httpRequest = wrapped_request
    getgenv().http_request = wrapped_request

    if syn then syn.request = wrapped_request end
    if fluxus then fluxus.request = wrapped_request end
end
local vu126 = game
game = nil
local v133 = {
    __index = function(_, pu127)
        local vu128 = vu126[pu127]
        return (pu127 == "HttpGet" or pu127 == "HttpGetAsync") and function(_, p129, ...)
            local v130 = os.clock()
            local v131 = {
                Url = tostring(p129),
                Method = "GET"
            }
            local v132 = vu126[pu127](vu126, p129, ...)
            vu77(v131, v132, v130, true)
            return v132
        end or (type(vu128) == "function" and function(_, ...)
            return vu128(vu126, ...)
        end or vu128)
    end
}
game = setmetatable({}, v133)
getgenv().copyRequest = v100
getgenv().saveRequest = v97
getgenv().getRequestHistory = function()
    vu23("Purple", "Request History:", 16)
    local v134, v135, v136 = pairs(vu26)
    while true do
        local v137
        v136, v137 = v134(v135, v136)
        if v136 == nil then
            break
        end
        vu23("Green", string.format("[%s] Request #%s", v137.timestamp, v136))
    end
end
if vu13.Enable then
    vu13.Enable()
end
vu23("Blue", string.rep("\239\191\189\239\191\189", 65), 16)
vu23("Purple", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 HTTP Spy Initialized", 16)
vu23("Gray", "made by SP4WN'ED - logging all HTTP traffic...", 14)
vu23("Green", "Commands available:", 14)
vu23("Gray", "\239\191\189\239\191\189 copyRequest(\"requestId\") - Copy request to clipboard")
vu23("Gray", "\239\191\189\239\191\189 saveRequest(\"requestId\") - Save request to file")
vu23("Gray", "\239\191\189\239\191\189 getRequestHistory() - Show all logged requests")
vu23("Green", "\239\191\189\239\191\189 HTTP Spy is now logging all requests~!", 14)
vu23("Gray", "Logging: Full request & response details, headers, body data")
vu23("Blue", string.rep("\239\191\189\239\191\189", 65), 16)
v125()
