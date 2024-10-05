
local library = {
    flags = {}
}

local Players = game:GetService "Players"
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local UserInputService = game:GetService "UserInputService"

local Current = nil
local function ChangeTab(Holder)
    if not Current then
        Current = Holder

        Holder.Visible = true
    end
    Current:TweenSize(UDim2.new(0, 347, 0, 0), "Out", "Sine", .4, false)
    task.wait(.4)
    Current.Visible = false
    Holder.Visible = true
    Holder:TweenSize(UDim2.new(0, 347, 0, 236), "Out", "Sine", .4, false)
    Current = Holder
end
local minimized = false
local function UIMinimize()
    if minimized then
        game.TweenService:Create(game.CoreGui.DarkX.Main,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 480, 0, 293)
            }):Play()
        minimized = false
    else
        game.TweenService:Create(game.CoreGui.DarkX.Main,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
        minimized = true
    end
end

local function drag(frame, hold)
    if not hold then
        hold = frame
    end
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale,
            startPos.Y.Offset + delta.Y)
    end

    hold.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End or UserInputService.TouchEnded then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or UserInputService.TouchMoved then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function library:new(Name)
    assert(Name, "A name is required")

    local DarkX = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainC = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local TopC = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")
    local Reduce = Instance.new("TextButton")
    local TopBar = Instance.new("Frame")
    local TabBG = Instance.new("Frame")
    local TabBGC = Instance.new("UICorner")
    local TabBar = Instance.new("Frame")
    local TabHolder = Instance.new("ScrollingFrame")
    local TabHolderLL = Instance.new("UIListLayout")
    local Open = Instance.new("TextButton")

    DarkX.Name = "DarkX"
    DarkX.Parent = game.CoreGui

    Main.Name = "Main"
    Main.Parent = DarkX
    Main.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.365726233, 0, 0.288220555, 0)
    Main.Size = UDim2.new(0, 480, 0, 293)
    Main.ClipsDescendants = true
    Main.Draggable = true
    Main.Active = true
    MainC.CornerRadius = UDim.new(0, 5)
    MainC.Name = "MainC"
    MainC.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 29)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(0, 480, 0, 42)
    Top.ZIndex = 4

    TopC.CornerRadius = UDim.new(0, 5)
    TopC.Name = "TopC"
    TopC.Parent = Top

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.00208333344, 0, 0.142857149, 0)
    Title.Size = UDim2.new(0, 479, 0, 29)
    Title.ZIndex = 10
    Title.FontFace =
        Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Title.Text = string.format("  %s", Name)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Close.Name = "Close"
    Close.Parent = Top
    Close.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.918685377, 0, 0.0246400386, 0)
    Close.Size = UDim2.new(0, 38, 0, 39)
    Close.ZIndex = 5
    Close.Font = Enum.Font.SourceSansBold
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextSize = 20.000
    Close.MouseButton1Down:Connect(function()
        game.TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        wait(0.5)
        DarkX:Destroy()
    end)

    Reduce.Name = "Reduce"
    Reduce.Parent = Top
    Reduce.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Reduce.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Reduce.BorderSizePixel = 0
    Reduce.Position = UDim2.new(0.839518726, 0, 0.0246400386, 0)
    Reduce.Size = UDim2.new(0, 38, 0, 39)
    Reduce.ZIndex = 5
    Reduce.Font = Enum.Font.Fantasy
    Reduce.TextScaled = true
    Reduce.Text = "-"
    Reduce.TextColor3 = Color3.fromRGB(255, 255, 255)
    Reduce.TextSize = 20.000
    Reduce.MouseButton1Down:Connect(function()
        UIMinimize()
    end)

    Open.Name = "Open"
    Open.Parent = DarkX
    Open.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Open.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
    Open.Size = UDim2.new(0, 61, 0, 32)
    Open.Font = Enum.Font.SourceSans
    Open.Text = "close/open"
    Open.TextColor3 = Color3.fromRGB(255, 255, 255)
    Open.TextSize = 14.000
    Open.Active = true
    Open.Draggable = true
    Open.MouseButton1Click:Connect(function()
        UIMinimize()
    end)

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Position = UDim2.new(0, 0, 0.0500000827, 0)
    TopBar.Size = UDim2.new(0, 480, 0, 27)
    TopBar.ZIndex = 3

    TabBG.Name = "TabBG"
    TabBG.Parent = Main
    TabBG.Active = true
    TabBG.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    TabBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabBG.BorderSizePixel = 0
    TabBG.Position = UDim2.new(0, 0, 0.119453922, 0)
    TabBG.Size = UDim2.new(0, 113, 0, 258)

    TabBGC.CornerRadius = UDim.new(0, 5)
    TabBGC.Name = "TabBGC"
    TabBGC.Parent = TabBG

    TabBar.Name = "TabBar"
    TabBar.Parent = TabBG
    TabBar.Active = true
    TabBar.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
    TabBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabBar.BorderSizePixel = 0
    TabBar.Position = UDim2.new(0.729768395, 0, 0, 0)
    TabBar.Size = UDim2.new(0, 38, 0, 258)

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = TabBG
    TabHolder.Active = true
    TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHolder.BackgroundTransparency = 1.000
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0.0454547368, 0, 0.0581395365, 0)
    TabHolder.Size = UDim2.new(0, 109, 0, 238)
    TabHolder.ZIndex = 4
    TabHolder.ScrollBarThickness = 0

    TabHolderLL.Name = "TabHolderLL"
    TabHolderLL.Parent = TabHolder
    TabHolderLL.SortOrder = Enum.SortOrder.LayoutOrder
    TabHolderLL.Padding = UDim.new(0, 5)

    TabHolderLL:GetPropertyChangedSignal "AbsoluteContentSize":Connect(function()
        TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolderLL.AbsoluteContentSize.Y + 8)
    end)

    drag(Main, Top)

    local Tabs = {}

    function Tabs:Tab(Name, IconID)
        assert(Name, "A name is required")
        assert(IconID, "An Icon is required")

        local Holder = Instance.new("ScrollingFrame")
        local HolderLL = Instance.new("UIListLayout")
        local Tab = Instance.new("TextButton")
        local TabC = Instance.new("UICorner")
        local Icon = Instance.new("ImageLabel")
        local Title = Instance.new("TextLabel")

        Holder.Name = "Holder"
        Holder.Parent = Main
        Holder.Active = true
        Holder.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Holder.BorderSizePixel = 0
        Holder.Position = UDim2.new(0.263477057, 0, 0.170767516, 0)
        Holder.Size = UDim2.new(0, 347, 0, 236)
        Holder.ScrollBarThickness = 0
        Holder.Visible = false

        HolderLL.Name = "HolderLL"
        HolderLL.Parent = Holder
        HolderLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
        HolderLL.SortOrder = Enum.SortOrder.LayoutOrder
        HolderLL.Padding = UDim.new(0, 5)

        Tab.Name = "Tab"
        Tab.Parent = TabHolder
        Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 109, 0, 34)
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.Unknown
        Tab.Text = ""
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 14.000
        Tab.MouseButton1Down:Connect(function()
            ChangeTab(Holder)
        end)
        if not Current then
            ChangeTab(Holder)
        end

        TabC.CornerRadius = UDim.new(0, 4)
        TabC.Name = "TabC"
        TabC.Parent = Tab
        local tabst = Instance.new("UIStroke")
        tabst.Name = "tabst"
        tabst.Parent = Tab
        tabst.Color = Color3.fromRGB(50, 50, 50)
        tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        Icon.Name = "Icon"
        Icon.Parent = Tab
        Icon.AnchorPoint = Vector2.new(0, 0.5)
        Icon.BackgroundTransparency = 1.000
        Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Icon.Position = UDim2.new(0, 4, 0, 17)
        Icon.Size = UDim2.new(0, 19, 0, 19)
        Icon.ZIndex = 3
        Icon.Image = string.format("rbxassetid://%s", IconID)
        Icon.ScaleType = Enum.ScaleType.Fit

        Title.Name = "Title"
        Title.Parent = Tab
        Title.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
        Title.BackgroundTransparency = 1.000
        Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0, 26, 0, 4)
        Title.Size = UDim2.new(0, 81, 0, 26)
        Title.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
            Enum.FontStyle.Normal)
        Title.Text = Name
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 14.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        HolderLL:GetPropertyChangedSignal "AbsoluteContentSize":Connect(function()
            Holder.CanvasSize = UDim2.new(0, 0, 0, HolderLL.AbsoluteContentSize.Y + 10)
        end)

        local Sections = {}

        function Sections:section(Name)
            assert(Name, "A Name is required")

            local Section = Instance.new("TextLabel")

            Section.Name = "Section"
            Section.Parent = Holder
            Section.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(0, 0, 1.29311772e-07, 0)
            Section.Size = UDim2.new(0, 344, 0, 26)
            Section.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold,
                Enum.FontStyle.Normal)
            Section.Text = Name
            Section.TextColor3 = Color3.fromRGB(255, 255, 255)
            Section.TextSize = 17.000
            Section.TextXAlignment = Enum.TextXAlignment.Left

            local Content = {}
            function Content:Label(Name)
                assert(Name, "A name is required")

                local Btn = Instance.new("TextButton")
                local BtnC = Instance.new("UICorner")
                local tabst = Instance.new("UIStroke")
                tabst.Name = "tabst"
                tabst.Parent = Btn
                tabst.Color = Color3.fromRGB(46, 46, 46)
                tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                Btn.Name = "Btn"
                Btn.Parent = Holder
                Btn.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Btn.BorderSizePixel = 0
                Btn.Position = UDim2.new(0, 0, 0.131355926, 0)
                Btn.Size = UDim2.new(0, 345, 0, 30)
                Btn.AutoButtonColor = false
                Btn.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                    Enum.FontStyle.Normal)
                Btn.Text = string.format("  %s", Name)
                Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Btn.TextSize = 14.000
                Btn.TextXAlignment = Enum.TextXAlignment.Left
                BtnC.CornerRadius = UDim.new(0, 3)
                BtnC.Name = "BtnC"
                BtnC.Parent = Btn
                return Btn
            end
            function Content:Button(Name, Callback)
                assert(Name, "A name is required")

                local Btn = Instance.new("TextButton")
                local BtnC = Instance.new("UICorner")
                local tabst = Instance.new("UIStroke")
                tabst.Name = "tabst"
                tabst.Parent = Btn
                tabst.Color = Color3.fromRGB(46, 46, 46)
                tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                Btn.Name = "Btn"
                Btn.Parent = Holder
                Btn.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Btn.BorderSizePixel = 0
                Btn.Position = UDim2.new(0, 0, 0.131355926, 0)
                Btn.Size = UDim2.new(0, 345, 0, 40)
                Btn.AutoButtonColor = false
                Btn.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                    Enum.FontStyle.Normal)
                Btn.Text = string.format("  %s", Name)
                Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Btn.TextSize = 14.000
                Btn.TextXAlignment = Enum.TextXAlignment.Left

                BtnC.CornerRadius = UDim.new(0, 3)
                BtnC.Name = "BtnC"
                BtnC.Parent = Btn

                Btn.MouseButton1Click:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 29)
                    task.wait(.2)
                    Btn.BackgroundColor3 = Color3.fromRGB(36, 36, 36)

                    task.spawn(Callback or function()
                    end)
                end)

                return Btn
            end

            function Content:Toggle(Name, Default, Callback)
                assert(Name, "A name is required")

                local Toggle = self:Button(Name, false)
                local Tog = Instance.new("TextButton")
                local ToggleC = Instance.new("UICorner")

                Tog.Name = "Tog"
                Tog.Parent = Toggle
                Tog.BackgroundColor3 = Color3.fromRGB(254, 3, 7)
                Tog.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Tog.BorderSizePixel = 0
                Tog.Position = UDim2.new(0.910000026, 0, 0.155000001, 2)
                Tog.Size = UDim2.new(0, 25, 0, 25)
                Tog.AutoButtonColor = false
                Tog.Font = Enum.Font.Ubuntu
                Tog.Text = ""
                Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
                Tog.TextSize = 14.000
                Tog.TextXAlignment = Enum.TextXAlignment.Left

                ToggleC.CornerRadius = UDim.new(0, 3)
                ToggleC.Name = "ToggleC"
                ToggleC.Parent = Tog

                local ToggleStates = {
                    ["true"] = Color3.fromRGB(16, 254, 44),
                    ["false"] = Color3.fromRGB(254, 3, 7)
                }

                local Funcs = {}

                Funcs.CurrentState = false

                function Funcs.SetState(self, State)
                    if State == Funcs.CurrentState then
                        return
                    end

                    if not State then
                        State = not Funcs.CurrentState
                    end

                    Tog.BackgroundColor3 = ToggleStates[tostring(State)]
                    Funcs.CurrentState = State
                    task.spawn(function()
                        Callback(State)
                    end)
                end

                if Default then
                    Funcs:SetState(true)
                end
                Tog.MouseButton1Down:Connect(function()
                    Funcs:SetState()
                end)
                return Funcs
            end

            function Content:TextBox(Name, Text, Callback)
                assert(Name, "A name is required")

                local TextBox = self:Button(Name, false)
                local Back = Instance.new("Frame")
                local Input = Instance.new("TextBox")
                local ToggleC = Instance.new("UICorner")
                local BackLL = Instance.new("UIListLayout")

                Back.Name = "Back"
                Back.Parent = TextBox
                Back.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Back.BackgroundTransparency = 1.000
                Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Back.BorderSizePixel = 0
                Back.Position = UDim2.new(0.446376801, 0, 0.205000311, 0)
                Back.Size = UDim2.new(0, 184, 0, 25)

                Input.Name = "Input"
                Input.Parent = Back
                Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Input.BorderSizePixel = 0
                Input.Position = UDim2.new(0.736086786, 0, 0.155000299, 2)
                Input.Size = UDim2.new(0, 85, 0, 25)
                Input.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular,
                    Enum.FontStyle.Normal)
                Input.Text = Text
                Input.TextColor3 = Color3.fromRGB(255, 255, 255)
                Input.TextSize = 14.000

                ToggleC.CornerRadius = UDim.new(0, 3)
                ToggleC.Name = "ToggleC"
                ToggleC.Parent = Input

                BackLL.Name = "BackLL"
                BackLL.Parent = Back
                BackLL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                BackLL.SortOrder = Enum.SortOrder.LayoutOrder

                Input.FocusLost:Connect(function()
                    Input.Text = (Input.Text == "" and Text) or Input.Text
                    Callback(Input.Text)
                end)

                Input:GetPropertyChangedSignal("TextBounds"):Connect(function()
                    Input.Size = UDim2.new(0, Input.TextBounds.X + 30, 0, 25)
                end)

                Input.Size = UDim2.new(0, Input.TextBounds.X + 30, 0, 25)

                return TextBox
            end

            function Content:KeyBind(Name, Key, Callback)
                assert(Name, "A name is required")

                local Key = (typeof(Key == "string") and Enum.KeyCode[Key] or Key)
                local banned = {
                    Return = true,
                    Space = true,
                    Tab = true,
                    Backquote = true,
                    CapsLock = true,
                    Escape = true,
                    Unknown = true
                }
                local shortNames = {
                    RightControl = "Right Ctrl",
                    LeftControl = "Left Ctrl",
                    LeftShift = "Left Shift",
                    RightShift = "Right Shift",
                    Semicolon = ";",
                    Quote = '"',
                    LeftBracket = "[",
                    RightBracket = "]",
                    Equals = "=",
                    Minus = "-",
                    RightAlt = "Right Alt",
                    LeftAlt = "Left Alt"
                }

                local bindKey = Key
                local keyTxt = (Key and (shortNames[Key.Name] or Key.Name) or "None")

                local KeyBind = self:Button(Name, false)
                local Back = Instance.new("Frame")
                local Input = Instance.new("TextButton")
                local ToggleC = Instance.new("UICorner")
                local BackLL = Instance.new("UIListLayout")

                Back.Name = "Back"
                Back.Parent = KeyBind
                Back.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Back.BackgroundTransparency = 1.000
                Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Back.BorderSizePixel = 0
                Back.Position = UDim2.new(0.446376801, 0, 0.205000311, 0)
                Back.Size = UDim2.new(0, 184, 0, 25)

                Input.Name = "Input"
                Input.Parent = Back
                Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Input.AutoButtonColor = false
                Input.BorderSizePixel = 0
                Input.Position = UDim2.new(0.736086786, 0, 0.155000299, 2)
                Input.Size = UDim2.new(0, 85, 0, 25)
                Input.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular,
                    Enum.FontStyle.Normal)
                Input.Text = keyTxt
                Input.TextColor3 = Color3.fromRGB(255, 255, 255)
                Input.TextSize = 14.000

                ToggleC.CornerRadius = UDim.new(0, 3)
                ToggleC.Name = "ToggleC"
                ToggleC.Parent = Input

                BackLL.Name = "BackLL"
                BackLL.Parent = Back
                BackLL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                BackLL.SortOrder = Enum.SortOrder.LayoutOrder

                UserInputService.InputBegan:Connect(function(inp, gpe)
                    if gpe then
                        return
                    end
                    if inp.UserInputType ~= Enum.UserInputType.Keyboard then
                        return
                    end
                    if inp.KeyCode ~= bindKey then
                        return
                    end
                    Callback(bindKey.Name)
                end)

                Input.MouseButton1Click:Connect(function()
                    Input.Text = "..."
                    task.wait()
                    local key, uwu = UserInputService.InputEnded:Wait()
                    local keyName = tostring(key.KeyCode.Name)
                    if key.UserInputType ~= Enum.UserInputType.Keyboard then
                        Input.Text = keyTxt
                        return
                    end
                    if banned[keyName] then
                        Input.Text = keyTxt
                        return
                    end
                    wait()
                    bindKey = Enum.KeyCode[keyName]
                    Input.Text = shortNames[keyName] or keyName
                end)

                Input:GetPropertyChangedSignal "TextBounds":Connect(function()
                    Input.Size = UDim2.new(0, Input.TextBounds.X + 30, 0, 25)
                end)

                Input.Size = UDim2.new(0, Input.TextBounds.X + 30, 0, 25)
            end

            function Content:Slider(Name, Default, min, max, test, Callback)
                assert(Name, "A name is required")

                local Slider = self:Button("", false)
                local Title = Instance.new("TextLabel")
                local Back = Instance.new("Frame")
                local BackC = Instance.new("UICorner")
                local Inner = Instance.new("Frame")
                local BackC_2 = Instance.new("UICorner")
                local Number = Instance.new("TextBox")
                local UICorner = Instance.new("UICorner")

                Number.Parent = Slider
                Number.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Number.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Number.BorderSizePixel = 0
                Number.Size = UDim2.new(0, 30, 0, 24)
                Number.Font = Enum.Font.SourceSans
                Number.Text = Default
                Number.TextColor3 = Color3.fromRGB(255, 255, 255)
                Number.TextSize = 14.000
                Number.TextWrapped = true
                Number.Position = UDim2.new(0.908695638, 0, 0.1, 0)
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Number
                Slider.Size = UDim2.new(0, 345, 0, 45)

                Title.Name = "Title"
                Title.Parent = Slider
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.00579710165, 0, 0.0967739522, 0)
                Title.Size = UDim2.new(0, 163, 0, 19)
                Title.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                    Enum.FontStyle.Normal)
                Title.Text = string.format("  %s", Name)
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                Back.Name = "Back"
                Back.Parent = Slider
                Back.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Back.BorderSizePixel = 0
                Back.Position = UDim2.new(0.0200000703, 0, 0.691000044, 0)
                Back.Size = UDim2.new(0, 331, 0, 8)

                BackC.CornerRadius = UDim.new(1, 0)
                BackC.Name = "BackC"
                BackC.Parent = Back

                Inner.Name = "Inner"
                Inner.Parent = Back
                Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Inner.BorderSizePixel = 0
                Inner.Size = UDim2.new(0, 332, 0, 8)

                BackC_2.CornerRadius = UDim.new(1, 0)
                BackC_2.Name = "BackC"
                BackC_2.Parent = Inner

                local funcs = {
                    SetValue = function(self, value)
                        local percent = (Mouse.X - Back.AbsolutePosition.X) / Back.AbsoluteSize.X

                        if value then
                            percent = (value - min) / (max - min)
                        end

                        percent = math.clamp(percent, 0, 1)
                        value = value or math.floor(min + (max - min) * percent)
                        Number.Text = tostring(value)
                        Inner.Size = UDim2.new(percent, 0, 1, 0)
                        Callback(tonumber(value))
                    end
                }

                funcs:SetValue(Default)

                local dragging, boxFocused, allowed = false, false, {
                    [""] = true,
                    ["-"] = true
                }
                Number.Focused:Connect(function()
                    boxFocused = true
                end)

                Number.FocusLost:Connect(function()
                    boxFocused = false
                    if Number.Text == "" then
                        funcs:SetValue(Default)
                    end
                end)
                Number:GetPropertyChangedSignal("Text"):Connect(function()
                    if not boxFocused then
                        return
                    end

                    if Number.Text == "" then
                        return
                    end

                    local text = Number.Text

                    if not tonumber(Number.Text) then
                        Number.Text = ""
                    end

                    if tonumber(Number.Text) > max then
                        funcs:SetValue(max)
                    end

                    funcs:SetValue(tonumber(text))
                end)
                Back.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        funcs:SetValue()
                        dragging = true
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 or
                        UserInputService.TouchEnded then
                        dragging = false
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        funcs:SetValue()
                    end
                end)
                Back.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Touch then
                        funcs:SetValue()
                        dragging = true
                    end
                end)

                game.UserInputService.InputEnded:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)

                game.UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.Touch then
                        funcs:SetValue()
                    end
                end)
            end

            function Content:DropDown(Name, Options, playerlib, test, Callback)
                assert(Name, "A name is required")
                local Dropdown = Instance.new("TextButton")
                local DropdownC = Instance.new("UICorner")
                local Search = Instance.new("TextBox")
                local SearchP = Instance.new("UIPadding")
                local DropdownBack = Instance.new("TextButton")
                local DropdownC_2 = Instance.new("UICorner")
                local DropdownLL = Instance.new("UIListLayout")
                local DropdownP = Instance.new("UIPadding")
                local Plus = Instance.new("TextButton")
                local Dropdown2 = Instance.new("TextButton")
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Holder
                Dropdown.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown.BorderSizePixel = 0
                Dropdown.Position = UDim2.new(-0.0201729108, 0, 0.394067794, 0)
                Dropdown.Size = UDim2.new(0, 345, 0, 40)
                Dropdown.ZIndex = 1
                Dropdown.AutoButtonColor = false
                Dropdown.Font = Enum.Font.Unknown
                Dropdown.Text = ""
                Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.TextSize = 14.000
                Dropdown.TextXAlignment = Enum.TextXAlignment.Left

                Dropdown2.Name = "Dropdown2"
                Dropdown2.Parent = Dropdown
                Dropdown2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                Dropdown2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Dropdown2.BorderSizePixel = 0
                Dropdown2.Position = UDim2.new(0, 0, 0, 0)
                Dropdown2.Size = UDim2.new(0, 345, 0, 40)
                Dropdown2.ZIndex = 5
                Dropdown2.AutoButtonColor = false
                Dropdown2.Font = Enum.Font.Unknown
                Dropdown2.Text = ""
                Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown2.TextSize = 14.000
                Dropdown2.TextXAlignment = Enum.TextXAlignment.Left
                local tabst = Instance.new("UIStroke")
                tabst.Name = "tabst"
                tabst.Parent = Dropdown2
                tabst.Color = Color3.fromRGB(46, 46, 46)
                tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                DropdownC.CornerRadius = UDim.new(0, 3)
                DropdownC.Name = "DropdownC"
                DropdownC.Parent = Dropdown

                Search.Name = "Search"
                Search.Parent = Dropdown2
                Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Search.BackgroundTransparency = 1.000
                Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Search.BorderSizePixel = 0
                Search.Position = UDim2.new(0.00579710165, 0, 0.150000006, 0)
                Search.Size = UDim2.new(0, 287, 0, 27)
                Search.ZIndex = 5
                Search.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                    Enum.FontStyle.Normal)
                Search.Text = Name
                Search.TextColor3 = Color3.fromRGB(255, 255, 255)
                Search.TextSize = 14.000
                Search.TextXAlignment = Enum.TextXAlignment.Left

                SearchP.Name = "SearchP"
                SearchP.Parent = Search
                SearchP.PaddingLeft = UDim.new(0, 3)

                DropdownBack.Name = "DropdownBack"
                DropdownBack.Parent = Dropdown
                DropdownBack.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                DropdownBack.BorderColor3 = Color3.fromRGB(0, 0, 0)
                DropdownBack.BorderSizePixel = 0
                DropdownBack.Position = UDim2.new(0, 0, 2.28881845e-06, 0)
                DropdownBack.Size = UDim2.new(0, 345, 0, 39)
                DropdownBack.AutoButtonColor = false
                DropdownBack.Font = Enum.Font.Unknown
                DropdownBack.Text = ""
                DropdownBack.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropdownBack.TextSize = 14.000
                DropdownBack.TextXAlignment = Enum.TextXAlignment.Left
                DropdownBack.ClipsDescendants = true
                local tabst = Instance.new("UIStroke")
                tabst.Name = "tabst"
                tabst.Parent = DropdownBack
                tabst.Color = Color3.fromRGB(46, 46, 46)
                tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                DropdownC_2.CornerRadius = UDim.new(0, 3)
                DropdownC_2.Name = "DropdownC"
                DropdownC_2.Parent = DropdownBack

                DropdownLL.Name = "DropdownLL"
                DropdownLL.Parent = DropdownBack
                DropdownLL.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownLL.Padding = UDim.new(0, 5)

                DropdownP.Name = "DropdownP"
                DropdownP.Parent = DropdownBack
                DropdownP.PaddingLeft = UDim.new(0, 5)
                DropdownP.PaddingTop = UDim.new(0, 40)

                Plus.Name = "Plus"
                Plus.Parent = Dropdown
                Plus.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                Plus.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Plus.BorderSizePixel = 0
                Plus.Position = UDim2.new(0.875228584, 0, 2.28881845e-06, 0)
                Plus.Size = UDim2.new(0, 42, 0, 39)
                Plus.ZIndex = 5
                Plus.AutoButtonColor = false
                Plus.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                    Enum.FontStyle.Normal)
                Plus.Text = "+"
                Plus.TextColor3 = Color3.fromRGB(255, 255, 255)
                Plus.TextSize = 20.000
                local PlayerList = function()
                    local AllPlayers = {}
                    for i, v in next, game:GetService "Players":GetChildren() do
                        table.insert(AllPlayers, v.Name)
                    end
                    return AllPlayers
                end
                Options = playerlib and PlayerList() or Options
                local setAllVisible = function()
                    local options = DropdownBack:GetChildren()
                    for i = 1, #options do
                        local option = options[i]
                        if option:IsA("TextButton") and option.Name:match("Option_") then
                            option.Visible = true
                        end
                    end
                end
                local searchDropdown = function(text)
                    local options = DropdownBack:GetChildren()
                    for i = 1, #options do
                        local option = options[i]
                        if text == "" then
                            setAllVisible()
                        else
                            if option:IsA("TextButton") and option.Name:match("Option_") then
                                if option.Text:lower():match(text:lower()) then
                                    option.Visible = true
                                else
                                    option.Visible = false
                                end
                            end
                        end
                    end
                end

                local open = false

                local function Open()
                    open = not open
                    Plus.Text = (open and "-" or "+")
                    Dropdown:TweenSize(UDim2.new(0, 347, 0, (open and DropdownLL.AbsoluteContentSize.Y + 50 or 40)),
                        "Out", "Sine", .4, false)
                    DropdownBack:TweenSize(UDim2.new(0, 347, 0,
                        (open and DropdownLL.AbsoluteContentSize.Y + 50 or 38)), "Out", "Sine", .4, false)
                    Holder.CanvasSize = UDim2.new(0, 0, 0,
                        (open and (Holder.CanvasSize.Y.Offset + DropdownLL.AbsoluteContentSize.Y + 50 / 2)) or
                            (Holder.CanvasSize.Y.Offset - DropdownLL.AbsoluteContentSize.Y - 30 / 2))
                end
                Search.Focused:Connect(function()
                    if open then
                        return
                    end
                    Open()
                end)
                Search:GetPropertyChangedSignal("Text"):Connect(function()
                    wait()
                    if not open then
                        return
                    end
                    searchDropdown(Search.Text)
                end)

                local Funcs = {}

                function Funcs.AddOption(self, Name2)
                    local Tab = Instance.new("TextButton")
                    local BtnC = Instance.new("UICorner")

                    Tab.Name = "Option_" .. Name2
                    Tab.Parent = DropdownBack
                    Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Tab.BorderSizePixel = 0
                    Tab.Position = UDim2.new(0.0101449275, 0, 0.203821659, 0)
                    Tab.Size = UDim2.new(0, 334, 0, 26)
                    Tab.AutoButtonColor = false
                    Tab.FontFace = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium,
                        Enum.FontStyle.Normal)
                    Tab.Text = string.format("  %s", Name2)
                    Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Tab.TextSize = 14.000
                    Tab.TextXAlignment = Enum.TextXAlignment.Left
                    local tabst = Instance.new("UIStroke")
                    tabst.Name = "tabst"
                    tabst.Parent = Tab
                    tabst.Color = Color3.fromRGB(46, 46, 46)
                    tabst.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    BtnC.CornerRadius = UDim.new(0, 3)
                    BtnC.Name = "BtnC"
                    BtnC.Parent = Tab

                    Tab.MouseButton1Click:Connect(function()
                        Open()
                        Callback(Name2)
                        Search.Text = Name2
                    end)
                end

                function Funcs.SetOptions(self, options)
                    for i, v in next, DropdownBack:GetChildren() do
                        if v:IsA "TextButton" then
                            v:Destroy()
                        end
                    end

                    for i, v in next, options do
                        Funcs:AddOption(tostring(v))
                    end
                end

                Funcs:SetOptions(Options)
                Plus.MouseButton1Click:Connect(function()
                    if playerlib then
                        Funcs:SetOptions(PlayerList())
                    end

                    Open()
                end)
                return Funcs
            end

            return Content
        end

        return Sections
    end

    return Tabs
end
return library
