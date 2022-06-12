-- settings (wip)
local antiAfk = true -- true/false    if true, you dont get kicked for being afk for 20 mins
local mainAcc = "UsernameOfYourMainAccountHere" -- string    not used rn
local ignoreSupported = false -- true/false    if true, this script will still load even if game is not supported (the only category that will load is "others")
-- script itself, dont change anything
if antiAfk then
    loadstring(game:HttpGet("https://pastebin.com/raw/sDXcYFhR", true))() -- anti afk kick (credits to warn)
end
local supported = {5278850819, 6403373529, 7860844204}
local char = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"}
local status
local msg
local db = true
local nam = ""
local notfollowing = true
for i=1, 10 do
    local rand = math.random(#char)
    nam = nam..char[rand]
end
local function followGui() -- follow gui function
    local folScreenGui = Instance.new("ScreenGui")
    local user = Instance.new("TextBox")
    local X = Instance.new("TextButton")
    local C = Instance.new("TextButton")
    local help = Instance.new("TextLabel")
    local V = Instance.new("TextButton")
    local htype = Instance.new("TextLabel")
    local ftype = Instance.new("TextButton")
    local hs = Instance.new("TextLabel")
    local s1 = Instance.new("TextButton")
    local s2 = Instance.new("TextButton")
    local s3 = Instance.new("TextButton")

    local follow = ""
    local followenabled = false
    local px,pz = 3,0 -- unused
    local followtype = 1 -- 1 walk, 2 tween, 3 teleport
    local TweenService = game:GetService("TweenService")

    folScreenGui.Parent = game.CoreGui

    user.Name = "user"
    user.Parent = folScreenGui
    user.AnchorPoint = Vector2.new(0.5, 0.5)
    user.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    user.BackgroundTransparency = 0.25
    user.Position = UDim2.new(0.5, 0, 0.5, 0)
    user.Size = UDim2.new(0.35, 0, 0.15, 0)
    user.PlaceholderText = "@username"
    user.Text = ""
    user.TextScaled = true

    X.Name = "X"
    X.Parent = folScreenGui
    X.AnchorPoint = Vector2.new(0.5, 0.5)
    X.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    X.BackgroundTransparency = 0.25
    X.Position = UDim2.new(0.375, 0, 0.625, 0)
    X.Size = UDim2.new(0.1, 0, 0.1, 0)
    X.Text = "X"
    X.TextScaled = true

    C.Name = "C"
    C.Parent = folScreenGui
    C.AnchorPoint = Vector2.new(0.5, 0.5)
    C.BackgroundColor3 = Color3.fromRGB(255, 179, 0)
    C.BackgroundTransparency = 0.25
    C.Position = UDim2.new(0.375, 0, 0.725, 0)
    C.Size = UDim2.new(0.1, 0, 0.1, 0)
    C.Text = "C"
    C.TextScaled = true

    help.Name = "help"
    help.Parent = folScreenGui
    help.AnchorPoint = Vector2.new(0.5, 0.5)
    help.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    help.BackgroundTransparency = 0.5
    help.Position = UDim2.new(0.5, 0, 0.25, 0)
    help.Size = UDim2.new(0.35, 0, 0.35, 0)
    help.Text = "Paste @username (case sensitive) and select follow method, then press V to follow the player. Press X to close this window. C to stop following."
    help.TextScaled = true

    V.Name = "V"
    V.Parent = folScreenGui
    V.AnchorPoint = Vector2.new(0.5, 0.5)
    V.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    V.BackgroundTransparency = 0.25
    V.Position = UDim2.new(0.375, 0, 0.825, 0)
    V.Size = UDim2.new(0.1, 0, 0.1, 0)
    V.Text = "V"
    V.TextScaled = true

    htype.Name = "htype"
    htype.Parent = folScreenGui
    htype.AnchorPoint = Vector2.new(0.5, 0.5)
    htype.BackgroundColor3 = Color3.fromRGB(200, 255, 200)
    htype.BackgroundTransparency = 0.25
    htype.Position = UDim2.new(0.487, 0, 0.625, 0)
    htype.Size = UDim2.new(0.125, 0, 0.1, 0)
    htype.Text = "Select follow method (click to change)"
    htype.TextScaled = true

    ftype.Name = "type"
    ftype.Parent = folScreenGui
    ftype.AnchorPoint = Vector2.new(0.5, 0.5)
    ftype.BackgroundColor3 = Color3.fromRGB(200, 255, 200)
    ftype.BackgroundTransparency = 0.5
    ftype.Position = UDim2.new(0.612, 0, 0.625, 0)
    ftype.Size = UDim2.new(0.125, 0, 0.1, 0)
    ftype.Text = "Walk (safest)"
    ftype.TextScaled = true

    --[[hs.Name = "hs"
    hs.Parent = folScreenGui
    hs.AnchorPoint = Vector2.new(0.5, 0.5)
    hs.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
    hs.BackgroundTransparency = 0.25
    hs.Position = UDim2.new(0.487, 0, 0.725, 0)
    hs.Size = UDim2.new(0.125, 0, 0.1, 0)
    hs.Text = "Settings"
    hs.TextScaled = true

    s1.Name = "s1"
    s1.Parent = folScreenGui
    s1.AnchorPoint = Vector2.new(0.5, 0.5)
    s1.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
    s1.BackgroundTransparency = 0.5
    s1.Position = UDim2.new(0.612, 0, 0.725, 0)
    s1.Size = UDim2.new(0.125, 0, 0.1, 0)
    s1.Text = "set1"
    s1.TextScaled = true

    s2.Name = "s2"
    s2.Parent = folScreenGui
    s2.AnchorPoint = Vector2.new(0.5, 0.5)
    s2.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
    s2.BackgroundTransparency = 0.5
    s2.Position = UDim2.new(0.612, 0, 0.825, 0)
    s2.Size = UDim2.new(0.125, 0, 0.1, 0)
    s2.Text = "set2"
    s2.TextScaled = true

    s3.Name = "s3"
    s3.Parent = folScreenGui
    s3.AnchorPoint = Vector2.new(0.5, 0.5)
    s3.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
    s3.BackgroundTransparency = 0.5
    s3.Position = UDim2.new(0.487, 0, 0.825, 0)
    s3.Size = UDim2.new(0.125, 0, 0.1, 0)
    s3.Text = "set3"
    s3.TextScaled = true]]

    -- settings, coming soon

    X.MouseButton1Up:Connect(function()
        folScreenGui:Destroy()
    end)
    C.MouseButton1Up:Connect(function()
        followenabled = false
    end)
    V.MouseButton1Up:Connect(function()
        follow = user.Text
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name == follow then
                followenabled = true
                if followtype == 1 then
                    while true do
                        if followenabled then
                            wait(.1)
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid",11):MoveTo(v.Character:WaitForChild("HumanoidRootPart",11).Position)
                        else break end
                    end
                elseif followtype == 2 then
                    -- todo: make this work
                elseif followtype == 3 then
                    while true do
                        if followenabled then
                            wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(px,0,pz)
                            end
                        else break end
                    end
                else
                    warn("Couldn't follow a player: something went wrong with follow type (somehow)")
                end
            end
        end
    end)
    ftype.MouseButton1Up:Connect(function()
        if followtype == 1 then
            ftype.Text = "Tween (balanced?) NOT WORKING"
            followtype = 2
        elseif followtype == 2 then
            ftype.Text = "Teleport (fastest)"
            followtype = 3
        elseif followtype == 3 then
            ftype.Text = "Walk (safest)"
            followtype = 1
        end
    end)
    --[[s1.MouseButton1Up:Connect(function()
        
    end)
    s2.MouseButton1Up:Connect(function()
        
    end)
    s3.MouseButton1Up:Connect(function()
        
    end)]]
end
local function loadOthers()
    local help = Instance.new("ScreenGui")
    local OthersTL1 = Instance.new("TextLabel", help)
    local OthersTL2 = Instance.new("TextLabel", help)
    local OthersTB1 = Instance.new("TextButton", help)
    local OthersTL3 = Instance.new("TextLabel", help)
    local OthersTB2 = Instance.new("TextButton", help)
    help.Parent = game.CoreGui
    help.Name = "AA_Others"

    OthersTL1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OthersTL1.BackgroundTransparency = 0.5
    OthersTL1.Position = UDim2.new(0.8, 0, 0, 0)
    OthersTL1.Size = UDim2.new(0.2, 0, 0.1, 0)
    OthersTL1.Font = Enum.Font.SourceSans
    OthersTL1.Text = "Others"
    OthersTL1.TextColor3 = Color3.fromRGB(0, 0, 0)
    OthersTL1.TextScaled = true

    OthersTL2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OthersTL2.BackgroundTransparency = 0.5
    OthersTL2.Position = UDim2.new(0.9, 0, 0.1, 0)
    OthersTL2.Size = UDim2.new(0.1, 0, 0.15, 0)
    OthersTL2.Font = Enum.Font.SourceSans
    OthersTL2.Text = "Make the bot follow any player you wish"
    OthersTL2.TextColor3 = Color3.fromRGB(0, 0, 0)
    OthersTL2.TextScaled = true

    OthersTB1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OthersTB1.BackgroundTransparency = 0.35
    OthersTB1.Position = UDim2.new(0.8, 0, 0.1, 0)
    OthersTB1.Size = UDim2.new(0.1, 0, 0.15, 0)
    OthersTB1.Font = Enum.Font.SourceSans
    OthersTB1.Text = "Follower GUI"
    OthersTB1.TextColor3 = Color3.fromRGB(0, 0, 0)
    OthersTB1.TextScaled = true

    --[[OthersTL3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OthersTL3.BackgroundTransparency = 0.5
    OthersTL3.Position = UDim2.new(0.9, 0, 0.25, 0)
    OthersTL3.Size = UDim2.new(0.1, 0, 0.1, 0)
    OthersTL3.Font = Enum.Font.SourceSans
    OthersTL3.Text = "Creates a wall out of bots, which can probably push the person"
    OthersTL3.TextColor3 = Color3.fromRGB(0, 0, 0)
    OthersTL3.TextScaled = true

    OthersTB2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OthersTB2.BackgroundTransparency = 0.35
    OthersTB2.Position = UDim2.new(0.8, 0, 0.25, 0)
    OthersTB2.Size = UDim2.new(0.1, 0, 0.1, 0)
    OthersTB2.Font = Enum.Font.SourceSans
    OthersTB2.Text = "Swarm Push"
    OthersTB2.TextColor3 = Color3.fromRGB(0, 0, 0)
    OthersTB2.TextScaled = true]]

    -- this one will be very fun. coming soon

    OthersTB1.MouseButton1Up:Connect(function()
        followGui()
    end)
end
for i,v in ipairs(supported) do
    if game.PlaceId == supported[i] then
        status = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        msg = "cool"
        db = false
    elseif db then
        status = "not supported"
        msg = "why"
    end
end
game.StarterGui:SetCore("SendNotification", {
    Title    = "Alt Autofarm 3.0.1 by v1ncept10n"; 
    Text     = "Game: " ..status; 
    Icon     = ""; 
    Duration = 10;
    Callback = bindableFunction;
    Button1  = msg;
})

if game.PlaceId == 5278850819 then -- saafytoo
    loadOthers()
    local walkpart = Instance.new("Part", game.Workspace)
    walkpart.Position = Vector3.new(0, 1, -24)
    walkpart.Anchored = true
    walkpart.CanCollide = false
    walkpart.Transparency = 1
    walkpart.Name = nam
    local ScreenGui = Instance.new("ScreenGui")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_4 = Instance.new("TextLabel")
    local TextButton_2 = Instance.new("TextButton")
    local TextLabel_5 = Instance.new("TextLabel")
    local TextButton_3 = Instance.new("TextButton")
    local TextButton_4 = Instance.new("TextButton")
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local Down = Instance.new("TextButton")
    local Up = Instance.new("TextButton")
    local Left = Instance.new("TextButton")
    local Right = Instance.new("TextButton")
    local TextLabel_6 = Instance.new("TextLabel")
    local TextButtonH = Instance.new("TextButton")

    local autowalk = false
    local markpos = false
    local silent = false

    ScreenGui.Parent = game.CoreGui

    Frame_2.Parent = ScreenGui
    Frame_2.BackgroundTransparency = 1
    Frame_2.Size = UDim2.new(1, 0, 1, 0)

    TextButtonH.Parent = ScreenGui
    TextButtonH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButtonH.BackgroundTransparency = 0.3
    TextButtonH.Position = UDim2.new(0.2, 0, 0, 0)
    TextButtonH.Size = UDim2.new(0.1, 0, 0.05, 0)
    TextButtonH.Font = Enum.Font.SourceSans
    TextButtonH.Text = "Hide/Open"
    TextButtonH.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButtonH.TextScaled = true

    TextLabel_2.Parent = ScreenGui
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 0.5
    TextLabel_2.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "Main"
    TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.TextScaled = true

    TextLabel_4.Parent = Frame_2
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 0.5
    TextLabel_4.Position = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_4.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_4.Font = Enum.Font.SourceSans
    TextLabel_4.Text = "Autowalk to the point you marked using the button below (default position: down)"
    TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.TextScaled = true

    TextButton_2.Parent = Frame_2
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 0.35
    TextButton_2.Position = UDim2.new(0, 0, 0.1, 0)
    TextButton_2.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = "Autowalk"
    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2.TextScaled = true

    TextButton_4.Parent = Frame_2
    TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_4.BackgroundTransparency = 0.35
    TextButton_4.Position = UDim2.new(0.1, 0, 0.2, 0)
    TextButton_4.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextButton_4.Font = Enum.Font.SourceSans
    TextButton_4.Text = "Mark autowalk position"
    TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_4.TextScaled = true

    Frame.Parent = ScreenGui
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.Visible = false

    ImageLabel.Parent = Frame
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    ImageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
    ImageLabel.Image = "http://www.roblox.com/asset/?id=9317442236"
    ImageLabel.ScaleType = Enum.ScaleType.Fit

    Down.Name = "Down"
    Down.Parent = Frame
    Down.AnchorPoint = Vector2.new(0.5, 0.5)
    Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Down.BackgroundTransparency = 1
    Down.Position = UDim2.new(0.5, 0, 0.7, 0)
    Down.Size = UDim2.new(0.05, 0, 0.1, 0)
    Down.Font = Enum.Font.SourceSans
    Down.Text = "X"
    Down.TextColor3 = Color3.fromRGB(255, 0, 4)
    Down.TextScaled = true
 
    Up.Name = "Up"
    Up.Parent = Frame
    Up.AnchorPoint = Vector2.new(0.5, 0.5)
    Up.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Up.BackgroundTransparency = 1
    Up.Position = UDim2.new(0.5, 0, 0.3, 0)
    Up.Size = UDim2.new(0.05, 0, 0.1, 0)
    Up.Font = Enum.Font.SourceSans
    Up.Text = "X"
    Up.TextColor3 = Color3.fromRGB(0, 0, 0)
    Up.TextScaled = true

    Left.Name = "Left"
    Left.Parent = Frame
    Left.AnchorPoint = Vector2.new(0.5, 0.5)
    Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Left.BackgroundTransparency = 1
    Left.Position = UDim2.new(0.4, 0, 0.5, 0)
    Left.Size = UDim2.new(0.05, 0, 0.1, 0)
    Left.Font = Enum.Font.SourceSans
    Left.Text = "X"
    Left.TextColor3 = Color3.fromRGB(0, 0, 0)
    Left.TextScaled = true

    Right.Name = "Right"
    Right.Parent = Frame
    Right.AnchorPoint = Vector2.new(0.5, 0.5)
    Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Right.BackgroundTransparency = 1
    Right.Position = UDim2.new(0.6, 0, 0.5, 0)
    Right.Size = UDim2.new(0.05, 0, 0.1, 0)
    Right.Font = Enum.Font.SourceSans
    Right.Text = "X"
    Right.TextColor3 = Color3.fromRGB(0, 0, 0)
    Right.TextScaled = true

    TextLabel_6.Parent = Frame
    TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 1
    TextLabel_6.Position = UDim2.new(0.58, 0, 0.4, 0)
    TextLabel_6.Size = UDim2.new(0.1, 0, 0.05, 0)
    TextLabel_6.Font = Enum.Font.SourceSans
    TextLabel_6.Text = "<-- these are leaderboards btw"
    TextLabel_6.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.TextScaled = true

    Down.MouseButton1Up:Connect(function()
        Down.TextColor3 = Color3.new(1,0,0)
        Up.TextColor3 = Color3.new(0,0,0)
        Left.TextColor3 = Color3.new(0,0,0)
        Right.TextColor3 = Color3.new(0,0,0)
        walkpart.Position = Vector3.new(0, 1, -24)
    end)
    Up.MouseButton1Up:Connect(function()
        Down.TextColor3 = Color3.new(0,0,0)
        Up.TextColor3 = Color3.new(1,0,0)
        Left.TextColor3 = Color3.new(0,0,0)
        Right.TextColor3 = Color3.new(0,0,0)
        walkpart.Position = Vector3.new(0, 1, 24)
    end)
    Left.MouseButton1Up:Connect(function()
        Down.TextColor3 = Color3.new(0,0,0)
        Up.TextColor3 = Color3.new(0,0,0)
        Left.TextColor3 = Color3.new(1,0,0)
        Right.TextColor3 = Color3.new(0,0,0)
        walkpart.Position = Vector3.new(24, 1, 0)
    end)
    Right.MouseButton1Up:Connect(function()
        Down.TextColor3 = Color3.new(0,0,0)
        Up.TextColor3 = Color3.new(0,0,0)
        Left.TextColor3 = Color3.new(0,0,0)
        Right.TextColor3 = Color3.new(1,0,0)
        walkpart.Position = Vector3.new(-24, 1, 0)
    end)
    TextButton_4.MouseButton1Up:Connect(function()
        if markpos then
            markpos = false
            TextButton_4.BackgroundColor3 = Color3.new(1,1,1)
            Frame.Visible = false
            TextButton_4.Text = "Change autowalk position"
        else
            markpos = true
            TextButton_4.BackgroundColor3 = Color3.new(0,1,0)
            Frame.Visible = true
            TextButton_4.Text = "Close"
        end
    end)
    TextButton_2.MouseButton1Up:Connect(function()
        if autowalk then
            autowalk = false
            TextButton_2.BackgroundColor3 = Color3.new(1,1,1)
        else
            autowalk = true
            TextButton_2.BackgroundColor3 = Color3.new(0,1,0)
        end
        while true do
            wait(.1)
            if autowalk then
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(walkpart.Position)
            else break end
        end
    end)
    TextButtonH.MouseButton1Up:Connect(function()
        Frame_2.Visible = not Frame_2.Visible
        if Frame_2.Visible then
            TextLabel_2.Transparency = .5
        else
            TextLabel_2.Transparency = .8
        end
    end)
elseif game.PlaceId == 6403373529 then -- slap battles
    loadOthers()
    local silentpart = Instance.new("Part", game.Workspace)
    silentpart.Position = Vector3.new(21469,420,21469)
    silentpart.Anchored = true
    silentpart.Size = Vector3.new(128,1,128)
    local kb1 = Instance.new("Part", game.Workspace)
    local kb2 = Instance.new("Part", game.Workspace)
    local kb3 = Instance.new("Part", game.Workspace)
    local kb4 = Instance.new("Part", game.Workspace)
    kb1.Anchored = true
    kb2.Anchored = true
    kb3.Anchored = true
    kb4.Anchored = true
    kb1.Color = Color3.new(1,0,0)
    kb2.Color = Color3.new(1,0,0)
    kb3.Color = Color3.new(1,0,0)
    kb4.Color = Color3.new(1,0,0)
    kb1.Size = Vector3.new(1,512,512)
    kb2.Size = Vector3.new(1,512,512)
    kb3.Size = Vector3.new(1,512,512)
    kb4.Size = Vector3.new(1,512,512)
    kb1.Transparency = 0.8
    kb2.Transparency = 0.8
    kb3.Transparency = 0.8
    kb4.Transparency = 0.8
    kb2.Orientation = Vector3.new(0,90,0)
    kb3.Orientation = Vector3.new(0,90,0)
    kb1.Position = Vector3.new(21661.5, 420, 21469)
    kb2.Position = Vector3.new(21469, 420, 21661.5)
    kb3.Position = Vector3.new(21469, 420, 21276.5)
    kb4.Position = Vector3.new(21276.5, 420, 21469)
    kb1.Touched:Connect(function(Hit)
        if Hit and Hit.Parent and Hit.Parent:FindFirstChild("Humanoid") then
            Hit.Parent.Humanoid.Health = 0
        end
    end)
    kb2.Touched:Connect(function(Hit)
        if Hit and Hit.Parent and Hit.Parent:FindFirstChild("Humanoid") then
            Hit.Parent.Humanoid.Health = 0
        end
    end)
    kb3.Touched:Connect(function(Hit)
        if Hit and Hit.Parent and Hit.Parent:FindFirstChild("Humanoid") then
            Hit.Parent.Humanoid.Health = 0
        end
    end)
    kb4.Touched:Connect(function(Hit)
        if Hit and Hit.Parent and Hit.Parent:FindFirstChild("Humanoid") then
            Hit.Parent.Humanoid.Health = 0
        end
    end)

    local autotp = false
    local silent = false
    local centre = false
    local antimegarock = false
    local autodie = false

    local ScreenGui = Instance.new("ScreenGui")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextButton_2 = Instance.new("TextButton")
    local main1 = Instance.new("Frame")
    local TextButton_3 = Instance.new("TextButton")
    local TextButton_4 = Instance.new("TextButton")
    local TextButton_5 = Instance.new("TextButton")
    local TextButton_6 = Instance.new("TextButton")
    local TextButton_7 = Instance.new("TextButton")
    local TextLabel_4 = Instance.new("TextLabel")
    local TextLabel_5 = Instance.new("TextLabel")
    local TextLabel_6 = Instance.new("TextLabel")
    local TextLabel_7 = Instance.new("TextLabel")
    local TextLabel_8 = Instance.new("TextLabel")

    ScreenGui.Parent = game.CoreGui

    TextLabel_2.Parent = ScreenGui
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 0.5
    TextLabel_2.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "Main"
    TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.TextScaled = true

    TextButton_2.Parent = ScreenGui
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 0.3
    TextButton_2.Position = UDim2.new(0.2, 0, -0, 0)
    TextButton_2.Size = UDim2.new(0.1, 0, 0.05, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = "Hide/Open"
    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2.TextScaled = true

    main1.Name = "main1"
    main1.Parent = ScreenGui
    main1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    main1.BackgroundTransparency = 1
    main1.Size = UDim2.new(1, 0, 1, 0)

    TextButton_3.Parent = main1
    TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.BackgroundTransparency = 0.3
    TextButton_3.Position = UDim2.new(0, 0, 0.1, 0)
    TextButton_3.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_3.Font = Enum.Font.SourceSans
    TextButton_3.Text = "Auto tp to normal arena"
    TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_3.TextScaled = true

    TextButton_4.Parent = main1
    TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_4.BackgroundTransparency = 0.3
    TextButton_4.Position = UDim2.new(0.2, 0, 0.1, 0)
    TextButton_4.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_4.Font = Enum.Font.SourceSans
    TextButton_4.Text = "Silent"
    TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_4.TextScaled = true

    TextButton_5.Parent = main1
    TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_5.BackgroundTransparency = 0.3
    TextButton_5.Position = UDim2.new(0.4, 0, 0.1, 0)
    TextButton_5.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_5.Font = Enum.Font.SourceSans
    TextButton_5.Text = "Immovable player"
    TextButton_5.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_5.TextScaled = true

    TextButton_6.Parent = main1
    TextButton_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_6.BackgroundTransparency = 0.3
    TextButton_6.Position = UDim2.new(0, 0, 0.2, 0)
    TextButton_6.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_6.Font = Enum.Font.SourceSans
    TextButton_6.Text = "Anti MEGAROCK (not implemented)"
    TextButton_6.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_6.TextScaled = true

    TextButton_7.Parent = main1
    TextButton_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_7.BackgroundTransparency = 0.3
    TextButton_7.Position = UDim2.new(0, 0, 0.3, 0)
    TextButton_7.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_7.Font = Enum.Font.SourceSans
    TextButton_7.Text = "Auto reset"
    TextButton_7.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_7.TextScaled = true

    TextLabel_4.Parent = main1
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 0.5
    TextLabel_4.Position = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_4.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_4.Font = Enum.Font.SourceSans
    TextLabel_4.Text = "Resizes the normal arena's portal size so you go into arena as soon as you respawn"
    TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.TextScaled = true

    TextLabel_5.Parent = main1
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 0.5
    TextLabel_5.Position = UDim2.new(0.3, 0, 0.1, 0)
    TextLabel_5.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_5.Font = Enum.Font.SourceSans
    TextLabel_5.Text = "You are teleported far away from normal arena, grinding becomes safer with this"
    TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.TextScaled = true

    TextLabel_6.Parent = main1
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 0.5
    TextLabel_6.Position = UDim2.new(0.5, 0, 0.1, 0)
    TextLabel_6.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_6.Font = Enum.Font.SourceSans
    TextLabel_6.Text = "Forces to spawn only in centre of normal arena (doesn't work with silent)"
    TextLabel_6.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.TextScaled = true

    TextLabel_7.Parent = main1
    TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_7.BackgroundTransparency = 0.5
    TextLabel_7.Position = UDim2.new(0.1, 0, 0.2, 0)
    TextLabel_7.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_7.Font = Enum.Font.SourceSans
    TextLabel_7.Text = "Self explanatory, auto deletes all megarocks and custom rocks"
    TextLabel_7.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_7.TextScaled = true

    TextLabel_8.Parent = main1
    TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_8.BackgroundTransparency = 0.5
    TextLabel_8.Position = UDim2.new(0.1, 0, 0.3, 0)
    TextLabel_8.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_8.Font = Enum.Font.SourceSans
    TextLabel_8.Text = "Sometimes player who got slapped multiple times will glitch and ragdoll indefinitely, resetting will unragdoll you, works best with \"auto tp to normal arena\" feature (you'll die every 10 seconds)"
    TextLabel_8.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_8.TextScaled = true

    TextButton_2.MouseButton1Up:Connect(function()
        main1.Visible = not main1.Visible
        if main1.Visible then
            TextLabel_2.Transparency = .5
        else
            TextLabel_2.Transparency = .8
        end
    end)

    TextButton_3.MouseButton1Up:Connect(function()
        if autotp == false then
            game.Workspace.Lobby.Teleport1.Size = Vector3.new(800,800,50)
            game.Workspace.Lobby.Teleport1.CanCollide = false
            game.Workspace.Lobby.Teleport1.Transparency = 0.95
            autotp = true
            TextButton_3.BackgroundColor3 = Color3.new(0,1,0)
        else
            game.Workspace.Lobby.Teleport1.Size = Vector3.new(0.86651, 14.0709, 8.57291)
            game.Workspace.Lobby.Teleport1.CanCollide = true
            game.Workspace.Lobby.Teleport1.Transparency = 0
            autotp = false
            TextButton_3.BackgroundColor3 = Color3.new(1,1,1)
        end
    end)

    TextButton_4.MouseButton1Up:Connect(function()
        if silent == false then
            TextButton_4.BackgroundColor3 = Color3.new(0,1,0)
            game.Workspace.Lobby.Teleport1.Position = Vector3.new(21469,414,21469)
            TextLabel_6.Visible = false
            TextButton_5.Visible = false
            silent = true
        else
            TextButton_4.BackgroundColor3 = Color3.new(1,1,1)
            game.Workspace.Lobby.Teleport1.Position = Vector3.new(-368.266, 328.214, 3.93014)
            TextLabel_6.Visible = true
            TextButton_5.Visible = true
            silent = false
        end
        while true do
            wait(.1)
            if silent then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart",15).CFrame = CFrame.new(21469,423,21469)
            else break end
        end
    end)

    TextButton_5.MouseButton1Up:Connect(function()
        if centre == false then
            game.Workspace.Arena.island3.Grass.Size = Vector3.new(100, 423, 423)
            game.Workspace.Arena.island2.Grass.Size = Vector3.new(100, 420, 420)
            game.Workspace.Arena.island1.Grass.Size = Vector3.new(100, 415, 415)
            game.Workspace.Arena.island3.Grass.Transparency = .9
            game.Workspace.Arena.island2.Grass.Transparency = .9
            game.Workspace.Arena.island1.Grass.Transparency = .9
            game.Workspace.Arena["main island"].Grass.Size = Vector3.new(30, 230, 230)
            game.Workspace.Arena["main island"].Grass.Position = Vector3.new(-4, 13, 2)
            game.Workspace.Arena["main island"].Grass.Transparency = .9
            game.Workspace.Arena.plank.Position = Vector3.new(16, 25, 0)
            game.Workspace.Arena.plank.Size = Vector3.new(25, 100, 100)
            game.Workspace.Arena.plank.Transparency = .9
            TextButton_4.Visible = false
            TextButton_5.BackgroundColor3 = Color3.new(0,1,0)
            TextLabel_5.Visible = false
            centre = true
        else
            game.Workspace.Arena.island3.Grass.Size = Vector3.new(0.594255, 118.851, 118.851)
            game.Workspace.Arena.island2.Grass.Size = Vector3.new(0.602483, 120.497, 120.497)
            game.Workspace.Arena.island1.Grass.Size = Vector3.new(0.587093, 117.419, 117.419)
            game.Workspace.Arena.island3.Grass.Transparency = 0
            game.Workspace.Arena.island2.Grass.Transparency = 0
            game.Workspace.Arena.island1.Grass.Transparency = 0
            game.Workspace.Arena["main island"].Grass.Size = Vector3.new(1.5, 230, 230)
            game.Workspace.Arena["main island"].Grass.Position = Vector3.new(-4.08817, -8.92294, 1.83554)
            game.Workspace.Arena["main island"].Grass.Transparency = 0
            game.Workspace.Arena.plank.Position = Vector3.new(51.9255, 358.023, -2.20965)
            game.Workspace.Arena.plank.Size = Vector3.new(25.3474, 0.5, 3)
            game.Workspace.Arena.plank.Transparency = 0
            TextButton_4.Visible = true
            TextButton_5.BackgroundColor3 = Color3.new(1,1,1)
            TextLabel_5.Visible = true
            centre = false
        end
        wait()
        spawn(function()
            while true do
                wait(.1)
                if centre then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart",15).CFrame = CFrame.new(0, -5.17293787, 0, -0.996404529, -3.0474002e-08, -0.0847228765, -2.22328023e-08, 1, -9.82159207e-08, 0.0847228765, -9.59791606e-08, -0.996404529)
                else break end
            end
        end)
        spawn(function()
            while true do
                wait(.15)
                if centre then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart",15).CFrame = CFrame.new(0, -5.17293787, 0, -0.996404529, -3.0474002e-08, -0.0847228765, -2.22328023e-08, 1, -9.82159207e-08, 0.0847228765, -9.59791606e-08, -0.996404529)
                else break end -- twice because it may break for no reason
            end
        end)
    end)

    TextButton_6.MouseButton1Up:Connect(function()
        print("antimegarock")
    end)

    TextButton_7.MouseButton1Up:Connect(function()
        if autodie == false then
            TextButton_7.BackgroundColor3 = Color3.new(0,1,0)
            autodie = true
        else
            TextButton_7.BackgroundColor3 = Color3.new(1,1,1)
            autodie = false
        end
        spawn(function()
            while true do
                wait(10)
                if autodie then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid",15).Health = 0
                else break end
            end
        end)
    end)
elseif game.PlaceId == 7860844204 then -- life sentence
    loadOthers()
    local oi = nil
    oi = hookmetamethod(game, "__index", function(Self, Key)
        if not checkcaller() and tostring(Self) == "TeleportPass" and Key == "Value" then
            return true
        end
        return oi(Self, Key)
    end) -- tp bypass
    local vim = game:service'VirtualInputManager'
    local help = Instance.new("ScreenGui")
    local main1 = Instance.new("Frame")
    local TextButton = Instance.new("TextButton")
    local TextButton_2 = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_5 = Instance.new("TextLabel")
    local TextLabel_6 = Instance.new("TextLabel")
    local TextButton_3 = Instance.new("TextButton")
    local TextButton_4 = Instance.new("TextButton")
    local TextButton_5 = Instance.new("TextButton")
    local autofarm = false
    local drop = false
    local collect = false
    help.Parent = game.CoreGui

    main1.Name = "main1"
    main1.Parent = help
    main1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    main1.BackgroundTransparency = 1
    main1.Size = UDim2.new(1, 0, 1, 0)

    TextButton.Parent = main1
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 0.35
    TextButton.Position = UDim2.new(0, 0, 0.2, 0)
    TextButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "Autodrop money"
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextScaled = true

    TextButton_2.Parent = main1
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 0.35
    TextButton_2.Position = UDim2.new(0, 0, 0.1, 0)
    TextButton_2.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = "Autofarm (workshop)"
    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2.TextScaled = true

    TextButton_5.Parent = main1
    TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_5.BackgroundTransparency = 0.35
    TextButton_5.Position = UDim2.new(0, 0, 0.3, 0)
    TextButton_5.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextButton_5.Font = Enum.Font.SourceSans
    TextButton_5.Text = "Autocollect money"
    TextButton_5.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_5.TextScaled = true

    TextLabel.Parent = main1
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 0.5
    TextLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Teleports to workshop and autopresses R for you (4$ in 5 seconds)"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true

    TextLabel_2.Parent = main1
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 0.5
    TextLabel_2.Position = UDim2.new(0.1, 0, 0.2, 0)
    TextLabel_2.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "Automatically drop 35$"
    TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.TextScaled = true

    TextLabel_5.Parent = help
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 0.5
    TextLabel_5.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_5.Font = Enum.Font.SourceSans
    TextLabel_5.Text = "Main"
    TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.TextScaled = true

    TextLabel_6.Parent = main1
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 0.5
    TextLabel_6.Size = UDim2.new(0.1, 0, 0.1, 0)
    TextLabel_6.Position = UDim2.new(0.1, 0, 0.3, 0)
    TextLabel_6.Font = Enum.Font.SourceSans
    TextLabel_6.Text = "Collects all cash near you"
    TextLabel_6.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.TextScaled = true

    TextButton_3.Parent = help
    TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.BackgroundTransparency = 0.3
    TextButton_3.Position = UDim2.new(0.2, 0, 0, 0)
    TextButton_3.Size = UDim2.new(0.1, 0, 0.05, 0)
    TextButton_3.Font = Enum.Font.SourceSans
    TextButton_3.Text = "Hide/Open"
    TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_3.TextScaled = true

    TextButton_4.Parent = help
    TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_4.BackgroundTransparency = 0.35
    TextButton_4.Position = UDim2.new(0.8, 0, 0.1, 0)
    TextButton_4.Size = UDim2.new(0.1, 0, 0.15, 0)
    TextButton_4.Font = Enum.Font.SourceSans
    TextButton_4.Text = "Follower GUI"
    TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_4.TextScaled = true

    TextButton_4.MouseButton1Up:Connect(function()
        followGui()
    end)
    TextButton_3.MouseButton1Up:Connect(function()
        main1.Visible = not main1.Visible
        if main1.Visible then
            TextLabel_5.Transparency = .5
        else
            TextLabel_5.Transparency = .8
        end
    end)
    TextButton_2.MouseButton1Up:Connect(function()
        if autofarm then
            TextButton_2.BackgroundColor3 = Color3.new(1,1,1)
            autofarm = false
        else
            TextButton_2.BackgroundColor3 = Color3.new(0,1,0)
            autofarm = true
        end
        spawn(function()
            while true do
                if autofarm then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.868393, 8, -136.296494, -0.249878272, -1.50765924e-08, -0.968277276, -1.99319583e-08, 1, -1.04267963e-08, 0.968277276, 1.66942318e-08, -0.249878272)
                    wait()
                    vim:SendKeyEvent(true, "R", false, game)
                    wait(5.5)
                    vim:SendKeyEvent(false, "R", false, game)
                else break end
            end
        end)
    end)
    TextButton.MouseButton1Up:Connect(function()
        if drop then
            TextButton.BackgroundColor3 = Color3.new(1,1,1)
            drop = false
        else
            TextButton.BackgroundColor3 = Color3.new(0,1,0)
            drop = true
        end
        spawn(function()
            while true do
                if drop then
                    game:GetService("ReplicatedStorage").Events.DropEvent:FireServer("DropCash", "35")
                    wait(1)
                else break end
            end
        end)
    end)
    TextButton_5.MouseButton1Up:Connect(function()
        if collect then
            TextButton_5.BackgroundColor3 = Color3.new(1,1,1)
            collect = false
        else
            TextButton_5.BackgroundColor3 = Color3.new(0,1,0)
            collect = true
        end
        spawn(function()
            while true do
                wait()
                if collect then
                    for _, v in next, Workspace:GetChildren() do
                        local Prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if Prompt and v.Name == "DroppedCash" and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < Prompt.MaxActivationDistance then
                            fireproximityprompt(Prompt)
                        end
                    end
                else break end
            end
        end)
    end)
elseif ignoreSupported then
    loadOthers()
end
