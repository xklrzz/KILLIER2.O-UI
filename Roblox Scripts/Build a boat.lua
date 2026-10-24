-- Loading Screen
loadstring(game:HttpGet("https://raw.githubusercontent.com/xklrzz/KILLIER2.O-UI/refs/heads/main/Loading%20UI"))()
pcall(function() loadstring(game:HttpGet("https://scriptblox.com/ingest/clientv2.lua"))("proj_334570f7c8b4", "1.0.0", false) end)
loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
stoploading()

add_label("Build a Boat")
local disable = false

-- Auto Farm Feature
add_switch("Auto Farm", function()
    local reset = false
    local restart = false
    disable = false
    local stage = workspace.BoatStages.NormalStages
    local player = game.Players.LocalPlayer

    local function startFarm()
        for i = 0, #stage:GetChildren() do
            if reset or disable then
                break
            end
            if base then
                base:Destroy()
            end

            local darkPart = "CaveStage" .. i + 1
            local part = stage:FindFirstChild(darkPart)
            if part then
                local darkness = part:FindFirstChild("DarknessPart")
                if darkness then
                    local root = player.Character:WaitForChild("HumanoidRootPart") 
                    root.Parent:FindFirstChild("Humanoid").WalkSpeed = 0
                    root.CFrame = darkness.CFrame

                    base = Instance.new("Part")
                    base.Parent = workspace
                    base.Anchored = true
                    base.Position = root.Position - Vector3.new(0, 10, 0)
                    base.Transparency = 1 
                    base.Size = Vector3.new(10, 2, 10)

                    local Event = workspace.ClaimRiverResultsGold
                    Event:FireServer()
                    task.wait(2)
                end
            end
        end

        if not reset then
            player.Character.Humanoid:TakeDamage(300)
            restart = true
        else
            reset = false
        end
    end

    local n = 1
    player.CharacterAdded:Connect(function()
        n += 1
        if not disable then
            if restart then
                restart = false
            else
                reset = true
            end
            task.wait(5)
            startFarm()        
        end                
    end)

    startFarm()
end, function()
    disable = true
end)

-- Water Configurations
local strg = game.ReplicatedStorage
local water = workspace.Water
local snd = workspace.Sand
local walk = false
local sandpos = snd.Position
local endPos = Vector3.new(-61, -10, 8623)
local waters = {} 

for _, water1 in pairs(workspace.BoatStages.NormalStages.TheEnd:GetChildren()) do
    if water1.Name == "water" then
        -- Fix applied here (changed waters.Name to water1.Name)
    end
end

add_switch("Walk on Water", function()
    walk = true
    water.CanTouch = false
    snd.Transparency = 1
    snd.Size += Vector3.new(0, 6, 0)

    local player = game.Players.LocalPlayer
    local root = player.Character.HumanoidRootPart
    local b = workspace.Sand

    while true do
        if not walk then
            snd.Position = sandpos
            break
        end

        local chr = player.Character
        root = chr:FindFirstChild("HumanoidRootPart")
        task.wait(0.2)

        if root then
            if root.Position.Z >= endPos.Z then
                b.CanCollide = false
            else
                b.CanCollide = true
            end
            b.Position = Vector3.new(-53.5, -29.9, root.Position.Z)
        end
    end
end, function()
    water.CanTouch = true
    snd.Transparency = 0
    snd.Size -= Vector3.new(0, 6, 0)
    walk = false
end)

add_textbox("Set Water Height", "1~20", snd.Size.Y, function(value)
    snd.Size = Vector3.new(snd.Size.X, value, snd.Size.Z)
end)

local noVelocity = false
local velo = 25

add_switch("No Water Velocity", function()
    snd.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    noVelocity = true
end, function()
    noVelocity = false
    snd.AssemblyLinearVelocity = Vector3.new(0, 0, velo)
end)

add_textbox("Set Water Velocity", "Value", velo, function(value) 
    velo = value
    if not noVelocity then
        snd.AssemblyLinearVelocity = Vector3.new(0, 0, value)
    end
end)

-- Quest Setup
local teams = game.Teams:GetChildren()
local playerTeam
local teamData = {}
for _, team in pairs(teams) do
    print(team.Name, team.TeamLeader.Value)
teamData[team.TeamLeader.Value] = team.Name
    if team.TeamLeader.Value == game.Players.LocalPlayer.Character.Name then
        print("found", team.Name)
        playerTeam = team.Name
    end
end
-- Events
add_label("Event")
local eventdata = {}
add_switch("Auto Farm Candy(Fixed)" ,function()
    eventdata.TickTreat = true
local eventPath = workspace.Houses
local player = game.Players.LocalPlayer
while eventdata.TickTreat do
						local plrpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						local house = workspace.Houses:GetChildren()
						for _, hs in house do
						    pcall(function()
						    local door = hs.Door.DoorInnerTouch
						   									 door.Transparency = 1
						    										door.CanCollide = false
														 									hs.Door.DoorInnerTouch.Position = plrpos
						        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
						end)
						end
    
    task.wait(5)
end
end, function() eventdata.TickTreat = false end)

-- Team Colors
local dict = {
    black = "BlackZone",
    blue = "Really blueZone",
    green = "CamoZone",
    magenta = "MagentaZone",
    red = "Really redZone",
    white = "WhiteZone",
    yellow = "New YellerZone"
}

local function quest(questID)
    local q = questID
    local plot = dict[playerTeam]
    local Event = workspace.QuestMakerEvent

    Event:FireServer(0)
    task.wait(2)
    Event:FireServer(q)
    task.wait(3)

    local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

    if q == 1 then
        task.wait(2)
        local oldPos = root.CFrame
        local part = workspace:FindFirstChild(plot).Quest.Cloud.Part2
        root.CFrame = part.CFrame
        task.wait(0.5)
        root.CFrame = oldPos
    elseif q == 2 then
        task.wait(1)
        local oldPos = root.CFrame
        root.CFrame = workspace:FindFirstChild(plot).Quest.Target.Part.CFrame
        task.wait(0.5)
        root.CFrame = oldPos
    elseif q == 3 then
        local oldPos = root.CFrame
        task.wait(3)
        root.CFrame = workspace:FindFirstChild(plot).Quest.Ramp:GetChildren()[24].CFrame
        task.wait(0.5)
        root.CFrame = oldPos
    elseif q == 4 then
        for i = 1, 5 do
            fireclickdetector(workspace:FindFirstChild(plot).Quest.Butter.PPart.ClickDetector)
            task.wait(3)
        end
    elseif q == 9 then
        local oldPos = root.CFrame
                                                                                                                                                                                root.CFrame = CFrame.new(-93, 57, 1379)
                                                                                                                                                                                task.wait(0.5)
                                                                                                                                                                                root.CFrame = workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame
                                                                                                                                                                                task.wait(0.5)
                                                                                                                                                                                root.CFrame = oldPos
    end
end

add_label("Auto Quests")
add_button("Cloud Quest", function() quest(1) end)
add_button("Target Quest", function() quest(2) end)
add_button("Ramp Quest", function() quest(3) end)
add_button("Find Me Quest", function() quest(4) end)
add_button("Thin Ice Quest", function() quest(9) end)
-- Buy Items
local qty = {}
local function buyItems(item)
    local Event = workspace.ItemBoughtFromShop
                                                                                                Event:InvokeServer(
                                                                                                    item,
                                                                                                    qty[item]
                                                                                                )
end
add_label("Buy Items")
add_textbox("Enter Qnty of PineTree","Quantity", 1,function(value) qty.PineTree = value end)
add_button("Buy PineTree 80 GOLD EACH", function() buyItems("PineTree") end)
-- Local Player Modifiers
add_label("Local Player")
local player = game.Players.LocalPlayer
local speed = add_textbox("Walk Speed", "Speed", player.Character.Humanoid.WalkSpeed, function(value) 
    player.Character.Humanoid.WalkSpeed = value
end)

local playerr = player.Character
local jump = playerr:WaitForChild("Humanoid").JumpHeight
local jumpheight = add_textbox("Jump Power ", " Value", playerr:WaitForChild("Humanoid").JumpHeight, function(value) 
    playerr:WaitForChild("Humanoid").UseJumpPower = false
    playerr:WaitForChild("Humanoid").JumpHeight = value
    jump = value
end)
local infJump = false
add_switch("Inf Jump", function()         infJump = true
end, function() infJump = false end)
game:GetService("UserInputService").JumpRequest:connect(function()
                                                                                        if infJump then
                                                                                                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
end
end)
local afk
add_switch("Anti AFK", function() 
    local VirtualUser = game:GetService("VirtualUser")
    local LocalPlayer = game:GetService("Players").LocalPlayer

    afk = LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    print("Anti-AFK Script Executed successfully!")
end, function()
    if afk then afk:Disconnect() end
end)

player.CharacterAdded:Connect(function()
    local humanoid = player.Character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = speed.Text
    humanoid.JumpHeight = jump
    humanoid.UseJumpPower = false
end)
local wayPoa
function waypoint(state)
local root = game.Players.LocalPlayer.Character.HumanoidRootPart
if state == "set" then
wayPos = root.CFrame
elseif state == "goto" then
root.CFrame = wayPos
end
end
add_button("Set Way Point", function() waypoint("set") end)
add_button("Teleport Way Point", function() waypoint("goto") end)
add_label("Players")
local playername = nil
local players = game.Players:GetChildren()
add_textbox("Player Name", "Player", "", function(value) playername = string.lower(value) end)
function findplayer(playerName)
local fp
    for _, plr in pairs(players) do
        if plr.Name == game.Players.LocalPlayer.Name then continue end
        local displayName = string.lower(plr.DisplayName)
        local foundPlayer = string.sub(displayName, 1, #playerName) == playerName or string.sub(string.lower(plr.Name), 1, #playerName) == playerName
        if foundPlayer then
            fp = plr
            break
        end
end
print(fp)
return fp
end
local plrData = {}
add_button("Teleport to Player", function() 
    local plr = findplayer(playername)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
end)
add_button("Remove Player Base Lock", function() 
    local plr = findplayer(playername)
   local teamcolor = teamData[plr.Name]
print(dict[teamcolor])
    workspace:FindFirstChild(dict[teamData[plr.Name]]).Lock:Destroy()
end)
add_switch("Loop Teleport To Player",function() 
    local plr = findplayer(playername)
    plrData.LoopTP = true
    while plrData.LoopTP do
        wait(0.05)
pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,03)
end)
    end
end, function() plrData.LoopTP = false end )
local camera = game.workspace.Camera
add_switch("Spectate Player",function() 
    local plr = findplayer(playername)
    camera.CameraSubject = plr.Character:WaitForChild("Humanoid")
end,function() camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end)

add_label("Support")
add_button("Dicord", function() setclipboard("https://discord.gg/24YJFmSdgE") end)
add_label("Keylss • KILLER2.O")