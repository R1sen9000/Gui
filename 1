--[[
    MyUILibrary v1.0
    Custom UI Library for Roblox Exploits
]]

local Library = {}
Library.__index = Library

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- Global tables
if not getgenv then getgenv = function() return _G end end
getgenv().Toggles = getgenv().Toggles or {}
getgenv().Options = getgenv().Options or {}
local Toggles = getgenv().Toggles
local Options = getgenv().Options

-- Utilities
local function Create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Parent" then inst[k] = v end
    end
    if props.Parent then inst.Parent = props.Parent end
    return inst
end

local function Tween(inst, props, time)
    local t = TweenService:Create(inst, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad), props)
    t:Play()
    return t
end

local function AddCorner(inst, r)
    return Create("UICorner", {CornerRadius = UDim.new(0, r or 6), Parent = inst})
end

local function AddStroke(inst, c, t)
    return Create("UIStroke", {Color = c or Color3.fromRGB(60, 60, 70), Thickness = t or 1, Parent = inst})
end

-- =============================================
-- MAIN LIBRARY
-- =============================================

function Library:CreateWindow(options)
    options = options or {}
    
    -- Destroy old UI
    if CoreGui:FindFirstChild("MyUILib") then
        CoreGui:FindFirstChild("MyUILib"):Destroy()
    end
    
    local Lib = setmetatable({}, Library)
    Lib.Tabs = {}
    Lib.Unloaded = false
    Lib.ToggleKeybind = nil
    Lib.UnloadCallbacks = {}
    Lib.Theme = {
        Primary = Color3.fromRGB(60, 60, 255),
        Background = Color3.fromRGB(20, 20, 25),
        Secondary = Color3.fromRGB(28, 28, 35),
        Tertiary = Color3.fromRGB(35, 35, 45),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(180, 180, 180),
        Accent = Color3.fromRGB(80, 200, 120)
    }
    
    -- ScreenGui
    Lib.ScreenGui = Create("ScreenGui", {
        Name = "MyUILib",
        Parent = CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false
    })
    
    -- Main Frame
    Lib.Main = Create("Frame", {
        Name = "Main",
        Size = UDim2.new(0, 550, 0, 400),
        Position = options.Center ~= false and UDim2.new(0.5, -275, 0.5, -200) or UDim2.new(0, 100, 0, 100),
        BackgroundColor3 = Lib.Theme.Background,
        BorderSizePixel = 0,
        Visible = options.AutoShow ~= false,
        Parent = Lib.ScreenGui
    })
    AddCorner(Lib.Main, 10)
    AddStroke(Lib.Main, Color3.fromRGB(50, 50, 60))
    
    -- Shadow
    Create("ImageLabel", {
        Size = UDim2.new(1, 30, 1, 30),
        Position = UDim2.new(0, -15, 0, -15),
        BackgroundTransparency = 1,
        Image = "rbxassetid://5554236805",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.6,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(23, 23, 277, 277),
        ZIndex = -1,
        Parent = Lib.Main
    })
    
    -- Title Bar
    Lib.TitleBar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Lib.Theme.Secondary,
        BorderSizePixel = 0,
        Parent = Lib.Main
    })
    AddCorner(Lib.TitleBar, 10)
    
    Create("Frame", {
        Size = UDim2.new(1, 0, 0, 15),
        Position = UDim2.new(0, 0, 1, -15),
        BackgroundColor3 = Lib.Theme.Secondary,
        BorderSizePixel = 0,
        Parent = Lib.TitleBar
    })
    
    Lib.TitleText = Create("TextLabel", {
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Title or "My UI Library",
        TextColor3 = Lib.Theme.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Lib.TitleBar
    })
    
    -- Close Button
    local CloseBtn = Create("TextButton", {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -35, 0, 6),
        BackgroundColor3 = Color3.fromRGB(255, 70, 70),
        Text = "×",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = Lib.TitleBar
    })
    AddCorner(CloseBtn, 6)
    
    CloseBtn.MouseButton1Click:Connect(function()
        Lib:Unload()
    end)
    
    -- Minimize Button
    local MinBtn = Create("TextButton", {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -68, 0, 6),
        BackgroundColor3 = Color3.fromRGB(255, 180, 0),
        Text = "−",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        Parent = Lib.TitleBar
    })
    AddCorner(MinBtn, 6)
    
    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        Tween(Lib.Main, {Size = minimized and UDim2.new(0, 550, 0, 40) or UDim2.new(0, 550, 0, 400)}, 0.3)
        MinBtn.Text = minimized and "+" or "−"
    end)
    
    -- Dragging
    local dragging, dragStart, startPos
    Lib.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Lib.Main.Position
        end
    end)
    
    Lib.TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Lib.Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Tab Container
    Lib.TabContainer = Create("Frame", {
        Size = UDim2.new(0, 120, 1, -50),
        Position = UDim2.new(0, 5, 0, 45),
        BackgroundColor3 = Lib.Theme.Secondary,
        BorderSizePixel = 0,
        Parent = Lib.Main
    })
    AddCorner(Lib.TabContainer, 8)
    
    Lib.TabList = Create("ScrollingFrame", {
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.new(0, 4, 0, 4),
        BackgroundTransparency = 1,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Lib.Theme.Primary,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = Lib.TabContainer
    })
    
    local TabLayout = Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        Parent = Lib.TabList
    })
    
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Lib.TabList.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
    end)
    
    -- Content Container
    Lib.Content = Create("Frame", {
        Size = UDim2.new(1, -135, 1, -50),
        Position = UDim2.new(0, 130, 0, 45),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = Lib.Main
    })
    
    -- Watermark
    Lib.Watermark = Create("Frame", {
        Size = UDim2.new(0, 150, 0, 28),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = Lib.Theme.Secondary,
        Visible = false,
        Parent = Lib.ScreenGui
    })
    AddCorner(Lib.Watermark, 6)
    AddStroke(Lib.Watermark, Color3.fromRGB(50, 50, 60))
    
    Lib.WatermarkText = Create("TextLabel", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        Text = "My UI Library",
        TextColor3 = Lib.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Lib.Watermark
    })
    
    -- Keybind Frame
    Lib.KeybindFrame = Create("Frame", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(1, -190, 0, 10),
        BackgroundColor3 = Lib.Theme.Secondary,
        Visible = false,
        Parent = Lib.ScreenGui
    })
    AddCorner(Lib.KeybindFrame, 6)
    AddStroke(Lib.KeybindFrame, Color3.fromRGB(50, 50, 60))
    
    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundTransparency = 1,
        Text = "  Keybinds",
        TextColor3 = Lib.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Lib.KeybindFrame
    })
    
    -- =============================================
    -- LIBRARY FUNCTIONS
    -- =============================================
    
    function Lib:SetWatermarkVisibility(v)
        Lib.Watermark.Visible = v
    end
    
    function Lib:SetWatermark(text)
        Lib.WatermarkText.Text = text
        Lib.Watermark.Size = UDim2.new(0, Lib.WatermarkText.TextBounds.X + 20, 0, 28)
    end
    
    function Lib:Notify(text, duration)
        duration = duration or 3
        
        local Notif = Create("Frame", {
            Size = UDim2.new(0, 280, 0, 0),
            Position = UDim2.new(1, 10, 1, -10),
            BackgroundColor3 = Lib.Theme.Secondary,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0, 1),
            Parent = Lib.ScreenGui
        })
        AddCorner(Notif, 8)
        AddStroke(Notif, Lib.Theme.Primary)
        
        local NotifText = Create("TextLabel", {
            Size = UDim2.new(1, -15, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Lib.Theme.Text,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Parent = Notif
        })
        
        local textHeight = NotifText.TextBounds.Y + 20
        textHeight = math.max(textHeight, 45)
        
        Tween(Notif, {Size = UDim2.new(0, 280, 0, textHeight), Position = UDim2.new(1, -290, 1, -10)}, 0.3)
        
        task.delay(duration, function()
            Tween(Notif, {Position = UDim2.new(1, 10, 1, -10)}, 0.3)
            task.wait(0.3)
            Notif:Destroy()
        end)
    end
    
    function Lib:OnUnload(callback)
        table.insert(Lib.UnloadCallbacks, callback)
    end
    
    function Lib:Unload()
        Lib.Unloaded = true
        for _, cb in ipairs(Lib.UnloadCallbacks) do
            pcall(cb)
        end
        Lib.ScreenGui:Destroy()
    end
    
    -- Toggle keybind
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if Lib.ToggleKeybind then
            local key = Lib.ToggleKeybind.Value
            if input.KeyCode == key or input.UserInputType == key then
                Lib.Main.Visible = not Lib.Main.Visible
            end
        end
    end)
    
    -- =============================================
    -- ADD TAB
    -- =============================================
    
    function Lib:AddTab(name)
        local Tab = {Name = name, Groupboxes = {}}
        
        -- Tab Button
        Tab.Button = Create("TextButton", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = Lib.Theme.Tertiary,
            Text = name,
            TextColor3 = Lib.Theme.TextDark,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            BorderSizePixel = 0,
            Parent = Lib.TabList
        })
        AddCorner(Tab.Button, 6)
        
        -- Tab Content
        Tab.Content = Create("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Lib.Theme.Primary,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Visible = false,
            Parent = Lib.Content
        })
        
        -- Columns
        Tab.Left = Create("Frame", {
            Size = UDim2.new(0.5, -5, 1, 0),
            BackgroundTransparency = 1,
            Parent = Tab.Content
        })
        
        local LeftLayout = Create("UIListLayout", {Padding = UDim.new(0, 8), Parent = Tab.Left})
        
        Tab.Right = Create("Frame", {
            Size = UDim2.new(0.5, -5, 1, 0),
            Position = UDim2.new(0.5, 5, 0, 0),
            BackgroundTransparency = 1,
            Parent = Tab.Content
        })
        
        local RightLayout = Create("UIListLayout", {Padding = UDim.new(0, 8), Parent = Tab.Right})
        
        -- Update canvas
        local function UpdateCanvas()
            local lh = LeftLayout.AbsoluteContentSize.Y
            local rh = RightLayout.AbsoluteContentSize.Y
            Tab.Content.CanvasSize = UDim2.new(0, 0, 0, math.max(lh, rh) + 10)
        end
        LeftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)
        RightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)
        
        -- Tab switching
        Tab.Button.MouseButton1Click:Connect(function()
            for _, t in pairs(Lib.Tabs) do
                t.Content.Visible = false
                Tween(t.Button, {BackgroundColor3 = Lib.Theme.Tertiary, TextColor3 = Lib.Theme.TextDark}, 0.15)
            end
            Tab.Content.Visible = true
            Tween(Tab.Button, {BackgroundColor3 = Lib.Theme.Primary, TextColor3 = Lib.Theme.Text}, 0.15)
        end)
        
        -- First tab active
        if #Lib.Tabs == 0 then
            Tab.Content.Visible = true
            Tab.Button.BackgroundColor3 = Lib.Theme.Primary
            Tab.Button.TextColor3 = Lib.Theme.Text
        end
        
        table.insert(Lib.Tabs, Tab)
        Lib.Tabs[name] = Tab
        
        -- =============================================
        -- GROUPBOX
        -- =============================================
        
        local function CreateGroupbox(name, side)
            local Box = {Name = name}
            local parent = side == "Left" and Tab.Left or Tab.Right
            
            Box.Frame = Create("Frame", {
                Size = UDim2.new(1, 0, 0, 0),
                BackgroundColor3 = Lib.Theme.Secondary,
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = parent
            })
            AddCorner(Box.Frame, 8)
            AddStroke(Box.Frame, Color3.fromRGB(45, 45, 55))
            
            Box.Title = Create("TextLabel", {
                Size = UDim2.new(1, -15, 0, 28),
                Position = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text = name,
                TextColor3 = Color3.fromRGB(180, 180, 255),
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = Box.Frame
            })
            
            Box.Container = Create("Frame", {
                Size = UDim2.new(1, -16, 0, 0),
                Position = UDim2.new(0, 8, 0, 28),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = Box.Frame
            })
            
            Create("UIListLayout", {Padding = UDim.new(0, 6), Parent = Box.Container})
            Create("UIPadding", {PaddingBottom = UDim.new(0, 8), Parent = Box.Container})
            
            -- =============================================
            -- TOGGLE
            -- =============================================
            
            function Box:AddToggle(idx, opts)
                opts = opts or {}
                local Toggle = {Value = opts.Default or false, Type = "Toggle"}
                
                local Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 28),
                    BackgroundTransparency = 1,
                    Parent = Box.Container
                })
                
                Create("TextLabel", {
                    Size = UDim2.new(1, -55, 1, 0),
                    BackgroundTransparency = 1,
                    Text = opts.Text or "Toggle",
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = Frame
                })
                
                local Btn = Create("Frame", {
                    Size = UDim2.new(0, 44, 0, 22),
                    Position = UDim2.new(1, -44, 0.5, -11),
                    BackgroundColor3 = Toggle.Value and Lib.Theme.Accent or Color3.fromRGB(60, 60, 70),
                    Parent = Frame
                })
                AddCorner(Btn, 11)
                
                local Circle = Create("Frame", {
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = Toggle.Value and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = Btn
                })
                AddCorner(Circle, 9)
                
                local Click = Create("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    Parent = Frame
                })
                
                local function Update()
                    Tween(Btn, {BackgroundColor3 = Toggle.Value and Lib.Theme.Accent or Color3.fromRGB(60, 60, 70)}, 0.2)
                    Tween(Circle, {Position = Toggle.Value and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}, 0.2)
                end
                
                Click.MouseButton1Click:Connect(function()
                    Toggle.Value = not Toggle.Value
                    Update()
                    if opts.Callback then pcall(opts.Callback, Toggle.Value) end
                    if Toggle.Changed then pcall(Toggle.Changed) end
                end)
                
                function Toggle:OnChanged(fn) Toggle.Changed = fn end
                function Toggle:SetValue(v) Toggle.Value = v; Update(); if opts.Callback then pcall(opts.Callback, v) end end
                
                Toggles[idx] = Toggle
                return Toggle
            end
            
            -- =============================================
            -- BUTTON
            -- =============================================
            
            function Box:AddButton(opts)
                opts = opts or {}
                local Button = {}
                local lastClick = 0
                
                Button.Frame = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 30),
                    BackgroundColor3 = Lib.Theme.Tertiary,
                    Text = opts.Text or "Button",
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    BorderSizePixel = 0,
                    Parent = Box.Container
                })
                AddCorner(Button.Frame, 6)
                
                Button.Frame.MouseEnter:Connect(function()
                    Tween(Button.Frame, {BackgroundColor3 = Color3.fromRGB(55, 55, 70)}, 0.1)
                end)
                Button.Frame.MouseLeave:Connect(function()
                    Tween(Button.Frame, {BackgroundColor3 = Lib.Theme.Tertiary}, 0.1)
                end)
                
                Button.Frame.MouseButton1Click:Connect(function()
                    if opts.DoubleClick then
                        local now = tick()
                        if now - lastClick < 0.4 then
                            if opts.Func then pcall(opts.Func) end
                            lastClick = 0
                        else
                            lastClick = now
                        end
                    else
                        if opts.Func then pcall(opts.Func) end
                    end
                end)
                
                function Button:AddButton(subOpts)
                    subOpts = subOpts or {}
                    local SubBtn = {}
                    local subLastClick = 0
                    
                    local Container = Create("Frame", {
                        Size = UDim2.new(1, 0, 0, 30),
                        BackgroundTransparency = 1,
                        Parent = Box.Container
                    })
                    
                    Button.Frame.Size = UDim2.new(0.5, -2, 1, 0)
                    Button.Frame.Parent = Container
                    
                    SubBtn.Frame = Create("TextButton", {
                        Size = UDim2.new(0.5, -2, 1, 0),
                        Position = UDim2.new(0.5, 2, 0, 0),
                        BackgroundColor3 = Lib.Theme.Tertiary,
                        Text = subOpts.Text or "Button",
                        TextColor3 = Lib.Theme.Text,
                        TextSize = 13,
                        Font = Enum.Font.Gotham,
                        BorderSizePixel = 0,
                        Parent = Container
                    })
                    AddCorner(SubBtn.Frame, 6)
                    
                    SubBtn.Frame.MouseEnter:Connect(function()
                        Tween(SubBtn.Frame, {BackgroundColor3 = Color3.fromRGB(55, 55, 70)}, 0.1)
                    end)
                    SubBtn.Frame.MouseLeave:Connect(function()
                        Tween(SubBtn.Frame, {BackgroundColor3 = Lib.Theme.Tertiary}, 0.1)
                    end)
                    
                    SubBtn.Frame.MouseButton1Click:Connect(function()
                        if subOpts.DoubleClick then
                            local now = tick()
                            if now - subLastClick < 0.4 then
                                if subOpts.Func then pcall(subOpts.Func) end
                                subLastClick = 0
                            else
                                subLastClick = now
                            end
                        else
                            if subOpts.Func then pcall(subOpts.Func) end
                        end
                    end)
                    
                    return SubBtn
                end
                
                return Button
            end
            
            -- =============================================
            -- SLIDER
            -- =============================================
            
            function Box:AddSlider(idx, opts)
                opts = opts or {}
                local min, max = opts.Min or 0, opts.Max or 100
                local default = opts.Default or min
                local rounding = opts.Rounding or 0
                local suffix = opts.Suffix or ""
                
                local Slider = {Value = default, Min = min, Max = max, Type = "Slider"}
                
                local Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, opts.Compact and 22 or 40),
                    BackgroundTransparency = 1,
                    Parent = Box.Container
                })
                
                if not opts.Compact then
                    Create("TextLabel", {
                        Size = UDim2.new(1, -50, 0, 18),
                        BackgroundTransparency = 1,
                        Text = opts.Text or "Slider",
                        TextColor3 = Lib.Theme.Text,
                        TextSize = 13,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Parent = Frame
                    })
                end
                
                local ValueLabel = Create("TextLabel", {
                    Size = UDim2.new(0, 45, 0, 18),
                    Position = UDim2.new(1, -45, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(default) .. suffix,
                    TextColor3 = Lib.Theme.TextDark,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Parent = Frame
                })
                
                local SliderBg = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 6),
                    Position = UDim2.new(0, 0, 0, opts.Compact and 10 or 26),
                    BackgroundColor3 = Color3.fromRGB(50, 50, 60),
                    Parent = Frame
                })
                AddCorner(SliderBg, 3)
                
                local Fill = Create("Frame", {
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = Lib.Theme.Primary,
                    Parent = SliderBg
                })
                AddCorner(Fill, 3)
                
                local dragging = false
                
                local function Update(input)
                    local pos = math.clamp((input.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
                    local val = min + (max - min) * pos
                    
                    if rounding == 0 then
                        val = math.floor(val)
                    else
                        val = math.floor(val * 10^rounding) / 10^rounding
                    end
                    
                    Slider.Value = val
                    Fill.Size = UDim2.new(pos, 0, 1, 0)
                    ValueLabel.Text = tostring(val) .. suffix
                    
                    if opts.Callback then pcall(opts.Callback, val) end
                    if Slider.Changed then pcall(Slider.Changed) end
                end
                
                SliderBg.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        Update(input)
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        Update(input)
                    end
                end)
                
                function Slider:OnChanged(fn) Slider.Changed = fn end
                function Slider:SetValue(v)
                    Slider.Value = math.clamp(v, min, max)
                    local pos = (Slider.Value - min) / (max - min)
                    Fill.Size = UDim2.new(pos, 0, 1, 0)
                    ValueLabel.Text = tostring(Slider.Value) .. suffix
                    if opts.Callback then pcall(opts.Callback, Slider.Value) end
                end
                
                Options[idx] = Slider
                return Slider
            end
            
            -- =============================================
            -- INPUT / TEXTBOX
            -- =============================================
            
            function Box:AddInput(idx, opts)
                opts = opts or {}
                local Input = {Value = opts.Default or "", Type = "Input"}
                
                local Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 48),
                    BackgroundTransparency = 1,
                    Parent = Box.Container
                })
                
                Create("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 18),
                    BackgroundTransparency = 1,
                    Text = opts.Text or "Input",
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = Frame
                })
                
                local TextBox = Create("TextBox", {
                    Size = UDim2.new(1, 0, 0, 26),
                    Position = UDim2.new(0, 0, 0, 20),
                    BackgroundColor3 = Color3.fromRGB(40, 40, 50),
                    Text = opts.Default or "",
                    PlaceholderText = opts.Placeholder or "",
                    PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    Parent = Frame
                })
                AddCorner(TextBox, 5)
                
                if opts.Numeric then
                    TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                        TextBox.Text = TextBox.Text:gsub("[^%d%.%-]", "")
                    end)
                end
                
                local function OnChange()
                    Input.Value = TextBox.Text
                    if opts.Callback then pcall(opts.Callback, Input.Value) end
                    if Input.Changed then pcall(Input.Changed) end
                end
                
                if opts.Finished then
                    TextBox.FocusLost:Connect(OnChange)
                else
                    TextBox:GetPropertyChangedSignal("Text"):Connect(OnChange)
                end
                
                function Input:OnChanged(fn) Input.Changed = fn end
                function Input:SetValue(v) TextBox.Text = tostring(v); Input.Value = tostring(v) end
                
                Options[idx] = Input
                return Input
            end
            
            -- =============================================
            -- DROPDOWN
            -- =============================================
            
            function Box:AddDropdown(idx, opts)
                opts = opts or {}
                local values = opts.Values or {}
                local multi = opts.Multi or false
                
                -- Player dropdown
                if opts.SpecialType == "Player" then
                    values = {}
                    for _, p in pairs(Players:GetPlayers()) do
                        table.insert(values, p.Name)
                    end
                    Players.PlayerAdded:Connect(function(p) table.insert(values, p.Name) end)
                    Players.PlayerRemoving:Connect(function(p)
                        for i, n in ipairs(values) do
                            if n == p.Name then table.remove(values, i); break end
                        end
                    end)
                end
                
                local default = opts.Default
                local Dropdown = {
                    Value = multi and {} or (type(default) == "number" and values[default] or default),
                    Values = values,
                    Multi = multi,
                    Type = "Dropdown"
                }
                
                local Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 48),
                    BackgroundTransparency = 1,
                    ClipsDescendants = false,
                    Parent = Box.Container
                })
                
                Create("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 18),
                    BackgroundTransparency = 1,
                    Text = opts.Text or "Dropdown",
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = Frame
                })
                
                local function GetDisplayText()
                    if multi then
                        local sel = {}
                        for k, v in pairs(Dropdown.Value) do
                            if v then table.insert(sel, k) end
                        end
                        return #sel > 0 and table.concat(sel, ", ") or "None"
                    else
                        return Dropdown.Value or "Select..."
                    end
                end
                
                local DropBtn = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 26),
                    Position = UDim2.new(0, 0, 0, 20),
                    BackgroundColor3 = Color3.fromRGB(40, 40, 50),
                    Text = "  " .. GetDisplayText() .. "  ▼",
                    TextColor3 = Lib.Theme.Text,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = Frame
                })
                AddCorner(DropBtn, 5)
                
                local OptionList = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 48),
                    BackgroundColor3 = Color3.fromRGB(35, 35, 45),
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 50,
                    Parent = Frame
                })
                AddCorner(OptionList, 6)
                
                Create("UIListLayout", {Padding = UDim.new(0, 2), Parent = OptionList})
                Create("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4), Parent = OptionList})
                
                local opened = false
                
                local function CreateOption(val)
                    local Opt = Create("TextButton", {
                        Size = UDim2.new(1, 0, 0, 24),
                        BackgroundColor3 = Color3.fromRGB(50, 50, 60),
                        Text = val,
                        TextColor3 = Lib.Theme.Text,
                        TextSize = 12,
                        Font = Enum.Font.Gotham,
                        ZIndex = 51,
                        Parent = OptionList
                    })
                    AddCorner(Opt, 4)
                    
                    Opt.MouseEnter:Connect(function() Tween(Opt, {BackgroundColor3 = Color3.fromRGB(65, 65, 80)}, 0.1) end)
                    Opt.MouseLeave:Connect(function() Tween(Opt, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.1) end)
                    
                    Opt.MouseButton1Click:Connect(function()
                        if multi then
                            Dropdown.Value[val] = not Dropdown.Value[val]
                        else
                            Dropdown.Value = val
                            opened = false
                            OptionList.Visible = false
                            Frame.Size = UDim2.new(1, 0, 0, 48)
                        end
                        DropBtn.Text = "  " .. GetDisplayText() .. "  ▼"
                        if opts.Callback then pcall(opts.Callback, Dropdown.Value) end
                        if Dropdown.Changed then pcall(Dropdown.Changed) end
                    end)
                end
                
                for _, v in ipairs(values) do CreateOption(v) end
                
                local listH = #values * 26 + 10
                
                DropBtn.MouseButton1Click:Connect(function()
                    opened = not opened
                    OptionList.Visible = opened
                    if opened then
                        OptionList.Size = UDim2.new(1, 0, 0, math.min(listH, 130))
                        Frame.Size = UDim2.new(1, 0, 0, 50 + math.min(listH, 130))
                    else
                        Frame.Size = UDim2.new(1, 0, 0, 48)
                    end
                end)
                
                function Dropdown:OnChanged(fn) Dropdown.Changed = fn end
                function Dropdown:SetValue(v) Dropdown.Value = v; DropBtn.Text = "  " .. GetDisplayText() .. "  ▼" end
                function Dropdown:Refresh(newVals)
                    values = newVals
                    Dropdown.Values = newVals
                    for _, c in pairs(OptionList:GetChildren()) do
                        if c:IsA("TextButton") then c:Destroy() end
                    end
                    for _, v in ipairs(newVals) do CreateOption(v) end
                    listH = #newVals * 26 + 10
                end
                
                Options[idx] = Dropdown
                return Dropdown
            end
            
            -- =============================================
            -- LABEL
            -- =============================================
            
            function Box:AddLabel(text, wrap)
                local LabelObj = {}
                
                local Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 22),
                    BackgroundTransparency = 1,
                    Parent = Box.Container
                })
                
                LabelObj.Label = Create("TextLabel", {
                    Size = UDim2.new(1, -70, 1, 0),
                    BackgroundTransparency = 1,
                    Text = text,
                    TextColor3 = Lib.Theme.TextDark,
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = wrap or false,
                    Parent = Frame
                })
                
                LabelObj.Frame = Frame
                
                -- AddKeyPicker to Label
                function LabelObj:AddKeyPicker(idx, opts)
                    opts = opts or {}
                    local KeyPicker = {
                        Value = opts.Default and (opts.Default == "MB1" and Enum.UserInputType.MouseButton1 or opts.Default == "MB2" and Enum.UserInputType.MouseButton2 or Enum.KeyCode[opts.Default]) or nil,
                        Mode = opts.Mode or "Toggle",
                        Text = opts.Text or "Keybind",
                        State = false,
                        Type = "KeyPicker"
                    }
                    
                    local KeyBtn = Create("TextButton", {
                        Size = UDim2.new(0, 60, 0, 18),
                        Position = UDim2.new(1, -60, 0.5, -9),
                        BackgroundColor3 = Color3.fromRGB(45, 45, 55),
                        Text = opts.Default or "None",
                        TextColor3 = Lib.Theme.TextDark,
                        TextSize = 11,
                        Font = Enum.Font.Gotham,
                        Parent = Frame
                    })
                    AddCorner(KeyBtn, 4)
                    
                    local listening = false
                    
                    KeyBtn.MouseButton1Click:Connect(function()
                        listening = true
                        KeyBtn.Text = "..."
                    end)
                    
                    UserInputService.InputBegan:Connect(function(input, processed)
                        if listening then
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                KeyPicker.Value = input.KeyCode
                                KeyBtn.Text = input.KeyCode.Name
                            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                                KeyPicker.Value = Enum.UserInputType.MouseButton1
                                KeyBtn.Text = "MB1"
                            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                                KeyPicker.Value = Enum.UserInputType.MouseButton2
                                KeyBtn.Text = "MB2"
                            end
                            listening = false
                            if opts.ChangedCallback then pcall(opts.ChangedCallback, KeyPicker.Value) end
                            if KeyPicker.ChangedFn then pcall(KeyPicker.ChangedFn) end
                            return
                        end
                        
                        if processed then return end
                        
                        if input.KeyCode == KeyPicker.Value or input.UserInputType == KeyPicker.Value then
                            if KeyPicker.Mode == "Toggle" then
                                KeyPicker.State = not KeyPicker.State
                                if opts.Callback then pcall(opts.Callback, KeyPicker.State) end
                                if KeyPicker.ClickFn then pcall(KeyPicker.ClickFn) end
                            elseif KeyPicker.Mode == "Hold" then
                                KeyPicker.State = true
                                if opts.Callback then pcall(opts.Callback, true) end
                            end
                        end
                    end)
                    
                    UserInputService.InputEnded:Connect(function(input)
                        if input.KeyCode == KeyPicker.Value or input.UserInputType == KeyPicker.Value then
                            if KeyPicker.Mode == "Hold" then
                                KeyPicker.State = false
                                if opts.Callback then pcall(opts.Callback, false) end
                            end
                        end
                    end)
                    
                    function KeyPicker:GetState() return KeyPicker.State end
                    function KeyPicker:OnClick(fn) KeyPicker.ClickFn = fn end
                    function KeyPicker:OnChanged(fn) KeyPicker.ChangedFn = fn end
                    function KeyPicker:SetValue(data)
                        if type(data) == "table" then
                            local key, mode = data[1], data[2]
                            if key == "MB1" then KeyPicker.Value = Enum.UserInputType.MouseButton1
                            elseif key == "MB2" then KeyPicker.Value = Enum.UserInputType.MouseButton2
                            else KeyPicker.Value = Enum.KeyCode[key] end
                            KeyPicker.Mode = mode
                            KeyBtn.Text = key
                        end
                    end
                    
                    Options[idx] = KeyPicker
                    return KeyPicker
                end
                
                -- AddColorPicker to Label
                function LabelObj:AddColorPicker(idx, opts)
                    opts = opts or {}
                    local ColorPicker = {
                        Value = opts.Default or Color3.new(1, 1, 1),
                        Transparency = opts.Transparency or 0,
                        Type = "ColorPicker"
                    }
                    
                    local ColorBtn = Create("TextButton", {
                        Size = UDim2.new(0, 28, 0, 18),
                        Position = UDim2.new(1, -28, 0.5, -9),
                        BackgroundColor3 = ColorPicker.Value,
                        Text = "",
                        Parent = Frame
                    })
                    AddCorner(ColorBtn, 4)
                    AddStroke(ColorBtn, Color3.fromRGB(80, 80, 90))
                    
                    local pickerOpen = false
                    local PickerFrame
                    
                    ColorBtn.MouseButton1Click:Connect(function()
                        pickerOpen = not pickerOpen
                        
                        if pickerOpen then
                            PickerFrame = Create("Frame", {
                                Size = UDim2.new(0, 180, 0, 180),
                                Position = UDim2.new(0, ColorBtn.AbsolutePosition.X - 150, 0, ColorBtn.AbsolutePosition.Y + 22),
                                BackgroundColor3 = Color3.fromRGB(30, 30, 38),
                                ZIndex = 100,
                                Parent = Lib.ScreenGui
                            })
                            AddCorner(PickerFrame, 8)
                            AddStroke(PickerFrame, Color3.fromRGB(60, 60, 70))
                            
                            Create("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 22),
                                BackgroundTransparency = 1,
                                Text = "  " .. (opts.Title or "Color"),
                                TextColor3 = Lib.Theme.Text,
                                TextSize = 13,
                                Font = Enum.Font.GothamBold,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 101,
                                Parent = PickerFrame
                            })
                            
                            local colors = {
                                Color3.fromRGB(255,0,0), Color3.fromRGB(255,128,0), Color3.fromRGB(255,255,0),
                                Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,128,255),
                                Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255), Color3.fromRGB(255,0,255),
                                Color3.fromRGB(255,255,255), Color3.fromRGB(128,128,128), Color3.fromRGB(0,0,0)
                            }
                            
                            local y = 26
                            for i, c in ipairs(colors) do
                                local x = ((i-1) % 6) * 27 + 8
                                if i > 1 and (i-1) % 6 == 0 then y = y + 27 end
                                
                                local ColorOpt = Create("TextButton", {
                                    Size = UDim2.new(0, 24, 0, 24),
                                    Position = UDim2.new(0, x, 0, y),
                                    BackgroundColor3 = c,
                                    Text = "",
                                    ZIndex = 101,
                                    Parent = PickerFrame
                                })
                                AddCorner(ColorOpt, 4)
                                
                                ColorOpt.MouseButton1Click:Connect(function()
                                    ColorPicker.Value = c
                                    ColorBtn.BackgroundColor3 = c
                                    if opts.Callback then pcall(opts.Callback, c) end
                                    if ColorPicker.Changed then pcall(ColorPicker.Changed) end
                                    PickerFrame:Destroy()
                                    pickerOpen = false
                                end)
                            end
                            
                            -- RGB inputs
                            local rVal, gVal, bVal = math.floor(ColorPicker.Value.R*255), math.floor(ColorPicker.Value.G*255), math.floor(ColorPicker.Value.B*255)
                            
                            local RInput = Create("TextBox", {Size = UDim2.new(0,45,0,22), Position = UDim2.new(0,8,0,85), BackgroundColor3 = Color3.fromRGB(45,45,55), Text = tostring(rVal), TextColor3 = Color3.fromRGB(255,100,100), TextSize = 12, Font = Enum.Font.Gotham, ZIndex = 101, Parent = PickerFrame})
                            AddCorner(RInput, 4)
                            
                            local GInput = Create("TextBox", {Size = UDim2.new(0,45,0,22), Position = UDim2.new(0,58,0,85), BackgroundColor3 = Color3.fromRGB(45,45,55), Text = tostring(gVal), TextColor3 = Color3.fromRGB(100,255,100), TextSize = 12, Font = Enum.Font.Gotham, ZIndex = 101, Parent = PickerFrame})
                            AddCorner(GInput, 4)
                            
                            local BInput = Create("TextBox", {Size = UDim2.new(0,45,0,22), Position = UDim2.new(0,108,0,85), BackgroundColor3 = Color3.fromRGB(45,45,55), Text = tostring(bVal), TextColor3 = Color3.fromRGB(100,100,255), TextSize = 12, Font = Enum.Font.Gotham, ZIndex = 101, Parent = PickerFrame})
                            AddCorner(BInput, 4)
                            
                            local ApplyBtn = Create("TextButton", {Size = UDim2.new(1,-16,0,24), Position = UDim2.new(0,8,0,115), BackgroundColor3 = Lib.Theme.Primary, Text = "Apply", TextColor3 = Lib.Theme.Text, TextSize = 12, Font = Enum.Font.GothamBold, ZIndex = 101, Parent = PickerFrame})
                            AddCorner(ApplyBtn, 5)
                            
                            ApplyBtn.MouseButton1Click:Connect(function()
                                local r = math.clamp(tonumber(RInput.Text) or 255, 0, 255)
                                local g = math.clamp(tonumber(GInput.Text) or 255, 0, 255)
                                local b = math.clamp(tonumber(BInput.Text) or 255, 0, 255)
                                local c = Color3.fromRGB(r, g, b)
                                ColorPicker.Value = c
                                ColorBtn.BackgroundColor3 = c
                                if opts.Callback then pcall(opts.Callback, c) end
                                if ColorPicker.Changed then pcall(ColorPicker.Changed) end
                                PickerFrame:Destroy()
                                pickerOpen = false
                            end)
                            
                            local CloseBtn = Create("TextButton", {Size = UDim2.new(1,-16,0,24), Position = UDim2.new(0,8,0,145), BackgroundColor3 = Color3.fromRGB(60,60,70), Text = "Close", TextColor3 = Lib.Theme.Text, TextSize = 12, Font = Enum.Font.Gotham, ZIndex = 101, Parent = PickerFrame})
                            AddCorner(CloseBtn, 5)
                            
                            CloseBtn.MouseButton1Click:Connect(function()
                                PickerFrame:Destroy()
                                pickerOpen = false
                            end)
                        else
                            if PickerFrame then PickerFrame:Destroy() end
                        end
                    end)
                    
                    function ColorPicker:OnChanged(fn) ColorPicker.Changed = fn end
                    function ColorPicker:SetValueRGB(c) ColorPicker.Value = c; ColorBtn.BackgroundColor3 = c; if opts.Callback then pcall(opts.Callback, c) end end
                    
                    Options[idx] = ColorPicker
                    return ColorPicker
                end
                
                return LabelObj
            end
            
            -- =============================================
            -- DIVIDER
            -- =============================================
            
            function Box:AddDivider()
                return Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 1),
                    BackgroundColor3 = Color3.fromRGB(55, 55, 65),
                    Parent = Box.Container
                })
            end
            
            -- =============================================
            -- DEPENDENCY BOX
            -- =============================================
            
            function Box:AddDependencyBox()
                local DepBox = {}
                
                DepBox.Frame = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ClipsDescendants = true,
                    Visible = false,
                    Parent = Box.Container
                })
                
                Create("UIListLayout", {Padding = UDim.new(0, 6), Parent = DepBox.Frame})
                
                DepBox.Container = DepBox.Frame
                
                -- Inherit methods
                for k, v in pairs(Box) do
                    if type(v) == "function" and k ~= "AddDependencyBox" then
                        DepBox[k] = function(self, ...)
                            local oldContainer = Box.Container
                            Box.Container = DepBox.Frame
                            local result = v(Box, ...)
                            Box.Container = oldContainer
                            return result
                        end
                    end
                end
                
                function DepBox:AddDependencyBox()
                    local SubDep = {}
                    SubDep.Frame = Create("Frame", {
                        Size = UDim2.new(1, 0, 0, 0),
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ClipsDescendants = true,
                        Visible = false,
                        Parent = DepBox.Frame
                    })
                    Create("UIListLayout", {Padding = UDim.new(0, 6), Parent = SubDep.Frame})
                    SubDep.Container = SubDep.Frame
                    
                    for k, v in pairs(Box) do
                        if type(v) == "function" then
                            SubDep[k] = function(self, ...)
                                local oldContainer = Box.Container
                                Box.Container = SubDep.Frame
                                local result = v(Box, ...)
                                Box.Container = oldContainer
                                return result
                            end
                        end
                    end
                    
                    function SubDep:SetupDependencies(deps)
                        local function Check()
                            local vis = true
                            for _, dep in ipairs(deps) do
                                if dep[1].Value ~= dep[2] then vis = false; break end
                            end
                            SubDep.Frame.Visible = vis
                        end
                        for _, dep in ipairs(deps) do
                            local oldChanged = dep[1].Changed
                            dep[1]:OnChanged(function()
                                if oldChanged then oldChanged() end
                                Check()
                            end)
                        end
                        Check()
                    end
                    
                    return SubDep
                end
                
                function DepBox:SetupDependencies(deps)
                    local function Check()
                        local vis = true
                        for _, dep in ipairs(deps) do
                            if dep[1].Value ~= dep[2] then vis = false; break end
                        end
                        DepBox.Frame.Visible = vis
                    end
                    for _, dep in ipairs(deps) do
                        local oldChanged = dep[1].Changed
                        dep[1]:OnChanged(function()
                            if oldChanged then oldChanged() end
                            Check()
                        end)
                    end
                    Check()
                end
                
                return DepBox
            end
            
            return Box
        end
        
        function Tab:AddLeftGroupbox(name) return CreateGroupbox(name, "Left") end
        function Tab:AddRightGroupbox(name) return CreateGroupbox(name, "Right") end
        
        -- =============================================
        -- TABBOX
        -- =============================================
        
        function Tab:AddLeftTabbox() return Tab:CreateTabbox("Left") end
        function Tab:AddRightTabbox() return Tab:CreateTabbox("Right") end
        
        function Tab:CreateTabbox(side)
            local Tabbox = {Tabs = {}}
            local parent = side == "Left" and Tab.Left or Tab.Right
            
            Tabbox.Frame = Create("Frame", {
                Size = UDim2.new(1, 0, 0, 180),
                BackgroundColor3 = Lib.Theme.Secondary,
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = parent
            })
            AddCorner(Tabbox.Frame, 8)
            AddStroke(Tabbox.Frame, Color3.fromRGB(45, 45, 55))
            
            Tabbox.TabBtns = Create("Frame", {
                Size = UDim2.new(1, 0, 0, 28),
                BackgroundTransparency = 1,
                Parent = Tabbox.Frame
            })
            
            Create("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 4), Parent = Tabbox.TabBtns})
            Create("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingTop = UDim.new(0, 5), Parent = Tabbox.TabBtns})
            
            Tabbox.Content = Create("Frame", {
                Size = UDim2.new(1, -10, 1, -35),
                Position = UDim2.new(0, 5, 0, 32),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.Y,
                Parent = Tabbox.Frame
            })
            
            function Tabbox:AddTab(name)
                local SubTab = {Name = name}
                
                SubTab.Button = Create("TextButton", {
                    Size = UDim2.new(0, 70, 0, 20),
                    BackgroundColor3 = Color3.fromRGB(40, 40, 50),
                    Text = name,
                    TextColor3 = Lib.Theme.TextDark,
                    TextSize = 12,
                    Font = Enum.Font.Gotham,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Parent = Tabbox.TabBtns
                })
                AddCorner(SubTab.Button, 5)
                Create("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), Parent = SubTab.Button})
                
                SubTab.Container = Create("Frame", {
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Visible = false,
                    Parent = Tabbox.Content
                })
                Create("UIListLayout", {Padding = UDim.new(0, 6), Parent = SubTab.Container})
                
                SubTab.Button.MouseButton1Click:Connect(function()
                    for _, t in pairs(Tabbox.Tabs) do
                        t.Container.Visible = false
                        Tween(t.Button, {BackgroundColor3 = Color3.fromRGB(40, 40, 50), TextColor3 = Lib.Theme.TextDark}, 0.1)
                    end
                    SubTab.Container.Visible = true
                    Tween(SubTab.Button, {BackgroundColor3 = Lib.Theme.Primary, TextColor3 = Lib.Theme.Text}, 0.1)
                end)
                
                if #Tabbox.Tabs == 0 then
                    SubTab.Container.Visible = true
                    SubTab.Button.BackgroundColor3 = Lib.Theme.Primary
                    SubTab.Button.TextColor3 = Lib.Theme.Text
                end
                
                -- Add methods to SubTab
                function SubTab:AddToggle(idx, opts)
                    opts = opts or {}
                    local Toggle = {Value = opts.Default or false, Type = "Toggle"}
                    
                    local Frame = Create("Frame", {Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, Parent = SubTab.Container})
                    Create("TextLabel", {Size = UDim2.new(1, -45, 1, 0), BackgroundTransparency = 1, Text = opts.Text or "Toggle", TextColor3 = Lib.Theme.Text, TextSize = 12, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = Frame})
                    
                    local Btn = Create("Frame", {Size = UDim2.new(0, 38, 0, 18), Position = UDim2.new(1, -38, 0.5, -9), BackgroundColor3 = Toggle.Value and Lib.Theme.Accent or Color3.fromRGB(60, 60, 70), Parent = Frame})
                    AddCorner(Btn, 9)
                    
                    local Circle = Create("Frame", {Size = UDim2.new(0, 14, 0, 14), Position = Toggle.Value and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Color3.fromRGB(255, 255, 255), Parent = Btn})
                    AddCorner(Circle, 7)
                    
                    local Click = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = Frame})
                    
                    local function Update()
                        Tween(Btn, {BackgroundColor3 = Toggle.Value and Lib.Theme.Accent or Color3.fromRGB(60, 60, 70)}, 0.15)
                        Tween(Circle, {Position = Toggle.Value and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)}, 0.15)
                    end
                    
                    Click.MouseButton1Click:Connect(function()
                        Toggle.Value = not Toggle.Value
                        Update()
                        if opts.Callback then pcall(opts.Callback, Toggle.Value) end
                        if Toggle.Changed then pcall(Toggle.Changed) end
                    end)
                    
                    function Toggle:OnChanged(fn) Toggle.Changed = fn end
                    function Toggle:SetValue(v) Toggle.Value = v; Update() end
                    
                    Toggles[idx] = Toggle
                    return Toggle
                end
                
                table.insert(Tabbox.Tabs, SubTab)
                return SubTab
            end
            
            return Tabbox
        end
        
        return Tab
    end
    
    return Lib
end

return Library
