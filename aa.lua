loadstring(game:HttpGet("https://pastebin.com/raw/sDXcYFhR", true))() -- anti afk kick (thx warn)
-- settings
-- none actually
-- script itself, dont change anything
local supported = {2572204670, 5278850819, 6403373529}
local char = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"}
local status
local msg
local db = true
local nam = ""
local follow = ""
local notfollowing = true
for i=1, 10 do
    local rand = math.random(#char)
    nam = nam..char[rand]
end
local function followGui(desc) -- follow gui function
    local follow = ""
    local fgui = Instance.new("ScreenGui")
    fgui.Parent = game.CoreGui
    local fgui2 = Instance.new("TextBox")
    fgui2.BackgroundColor3 = Color3.new(1,1,1)
    fgui2.Parent = gui
    fgui2.AnchorPoint = Vector2.new(0.5, 0.5)
    fgui2.Position = UDim2.new(0.5, 0, 0.5, 0)
    fgui2.Size = UDim2.new(0.25, 0, 0.25, 0)
    fgui2.TextScaled = true
    local fgui3 = Instance.new("TextButton")
    fgui3.Parent = gui
    fgui3.AnchorPoint = Vector2.new(0.5, 0.5)
    fgui3.Position = UDim2.new(0.437, 0, 0.657, 0)
    fgui3.Text = "X"
    fgui3.BackgroundColor3 = Color3.new(1,0,0)
    fgui3.Transparency = 0
    fgui3.Size = UDim2.new(0.125, 0, 0, 50)
    fgui3.TextScaled = true
    local fgui4 = Instance.new("TextButton")
    fgui4.Parent = gui
    fgui4.AnchorPoint = Vector2.new(0.5, 0.5)
    fgui4.Position = UDim2.new(0.562, 0, 0.657, 0)
    fgui4.Text = "V"
    fgui4.BackgroundColor3 = Color3.new(0,1,0)
    fgui4.Transparency = 0
    fgui4.Size = UDim2.new(0.125, 0, 0, 50)
    fgui4.TextScaled = true
    local fgui5 = Instance.new("TextLabel")
    fgui5.BackgroundColor3 = Color3.new(1,1,1)
    fgui5.Parent = gui
    fgui5.AnchorPoint = Vector2.new(0.5, 0.5)
    fgui5.Position = UDim2.new(0.5, 0, 0.228, 0)
    fgui5.Size = UDim2.new(0.25, 0, 0.293, 0)
    fgui5.Text = desc
    fgui5.TextScaled = true
    fgui3.MouseButton1Up:Connect(function()
        notfollowing = true
        fgui:Destroy()
    end)
    game.Players.ChildRemoved:Connect(function(instance)
        if instance.Name == follow then
            error(instance.Name.. " left the game, stopping following")
        end
    end)
    fgui4.MouseButton1Up:Connect(function()
        follow = gui2.Text
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name == follow then
                gui:Destroy()
                while true do
                    wait(.1)
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid",11):MoveTo(v.Character:WaitForChild("HumanoidRootPart",11).Position)
                end
            end
        end
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
    Title    = "Alt Autofarm by serglight 1.1.0"; 
    Text     = "Game: " ..status; 
    Icon     = ""; 
    Duration = 10;
    Callback = bindableFunction;
    Button1  = msg;
})

if game.PlaceId == 2572204670 then -- mugen
    while true do
        wait(.2)
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 5).CFrame = CFrame.new(23.6253471, 37.8501015, -158.833344, 0.137753755, -1.50884674e-08, 0.990466535, 7.29230143e-09, 1, 1.42194869e-08, -0.990466535, 5.26399235e-09, 0.137753755)
    end
elseif game.PlaceId == 5278850819 then -- saafytoo
    followGui("paste the @username and press V to make the bot go to this player (you can't change the player, keep that in mind), otherwise press X (bots will be walking outside of safe zone); also if the gui doesnt close when you pressed V, you probably made a typo in username; WARNING: IF YOU PRESS V THEN THIS WILL STOP WORKING IF PLAYER WHO IS FOLLOWED LEAVES THE GAME")
    local part = Instance.new("part")
    part.Anchored = true
    part.CanCollide = false
    part.Parent = game.Workspace
    part.Name = nams
    part.Position = Vector3.new(0, 1, -24)
    while notfollowing do
        wait(.2)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):MoveTo(part.Position)
    end
elseif game.PlaceId == 6403373529 then -- slap battles
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
    local TextButton = Instance.new("TextButton")
    local TextLabel = Instance.new("TextLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_3 = Instance.new("TextLabel")
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

    TextButton.Parent = ScreenGui
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 0.3
    TextButton.Position = UDim2.new(0.8, 0, 0.1, 0)
    TextButton.Size = UDim2.new(0.1, 0, 0.15, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "Follower GUI"
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextScaled = true

    TextLabel.Parent = ScreenGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 0.5
    TextLabel.Position = UDim2.new(0.9, 0, 0.1, 0)
    TextLabel.Size = UDim2.new(0.1, 0, 0.15, 0)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Make the bot autowalk to any player you wish (a GUI will show up with instructions)"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true

    TextLabel_2.Parent = ScreenGui
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 0.5
    TextLabel_2.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "Main"
    TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.TextScaled = true

    TextLabel_3.Parent = ScreenGui
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 0.5
    TextLabel_3.Position = UDim2.new(0.8, 0, 0, 0)
    TextLabel_3.Size = UDim2.new(0.2, 0, 0.1, 0)
    TextLabel_3.Font = Enum.Font.SourceSans
    TextLabel_3.Text = "Others"
    TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.TextScaled = true

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
    TextButton_6.Text = "Anti MEGAROCK"
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
    TextLabel_7.Text = "Self explanatory, auto deletes all megarocks and custom rocks (i will add this later)"
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

    TextButton.MouseButton1Up:Connect(function()
        followGui("Paste the @username and press V to make the bot go to this player (you can't change the player, keep that in mind), otherwise press X (bots will stay still); also if the gui doesnt close when you pressed V, you probably made a typo in username; WARNING: IF YOU PRESS V THEN THIS WILL STOP WORKING IF PLAYER WHO IS FOLLOWED LEAVES THE GAME")
    end)

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
end
        status = "not supported"
        msg = "why"
    end
end
game.StarterGui:SetCore("SendNotification", {
    Title    = "Alt Autofarm by serglight 1.0"; 
    Text     = "Game: " ..status; 
    Icon     = ""; 
    Duration = 10;
    Callback = bindableFunction;
    Button1  = msg;
})

if game.PlaceId == 2572204670 then
    while true do
        wait(.2)
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 5).CFrame = CFrame.new(23.6253471, 37.8501015, -158.833344, 0.137753755, -1.50884674e-08, 0.990466535, 7.29230143e-09, 1, 1.42194869e-08, -0.990466535, 5.26399235e-09, 0.137753755)
    end
elseif game.PlaceId == 5278850819 then
    local part = Instance.new("part")
    part.Anchored = true
    part.CanCollide = false
    part.Parent = game.Workspace
    part.Name = nams
    part.Position = Vector3.new(0, 1, -24)
    while true do
        wait(.2)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):MoveTo(part.Position)
    end
end
