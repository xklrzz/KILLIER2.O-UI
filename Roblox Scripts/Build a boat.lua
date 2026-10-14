-- Loading Screen
loadstring(game:HttpGet("https://raw.githubusercontent.com/xklrzz/KILLIER2.O-UI/refs/heads/main/Loading%20UI"))()


loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
stoploading()
add_label("Build a Boat")
local disable = false
add_switch("Auto Farm", function()
                local reset = false
local restart = false
                disable = false
local stage = workspace.BoatStages.NormalStages
local player = game.Players.LocalPlayer
function startFarm()
                for i=0, #stage:GetChildren() do
                                if reset or disable then
                                                break
                                end
                if base then
                base:Destroy()
                end
                local darkPart = "CaveStage".. i+1
                local part = stage:FindFirstChild(darkPart)
                if part then
                local darkness = part:FindFirstChild("DarknessPart")
                if darkness then
                local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") 
root.Parent:FindFirstChild("Humanoid").WalkSpeed = 0
                root.CFrame = darkness.CFrame
                base = Instance.new("Part")
                base.Parent = workspace
                base.Anchored = true
                base.Position = root.Position - Vector3.new(0,10,0)
base.Transparency = 1 
                base.Size = Vector3.new(10,2,10)
                local Event = workspace.ClaimRiverResultsGold
                Event:FireServer()
                wait(2)
                end
                end
                end
if not reset then
                game.Players.LocalPlayer.Character.Humanoid:TakeDamage(300)
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
            reset  = true
                end
task.wait(5)
startFarm()        
end                
end)
startFarm()
end,function()
                disable = true
end
)

local strg = game.ReplicatedStorage
local water = workspace.Water
local snd = workspace.Sand
local walk = false
local sandpos = snd.Position
local endPos = Vector3.new(-61, -10, 8623)
local waters = {} --?
for _ , water1 in pairs(workspace.BoatStages.NormalStages.TheEnd:GetChildren()) do
if waters.Name == "water"  then
-- Fix
end
end
add_switch("Walk on Water", function()
walk = true
                water.CanTouch = false
                snd.Transparency = 1
                snd.Size += Vector3.new(0,6,0)
local root = game.Players.LocalPlayer.Character.HumanoidRootPart
local b = workspace.Sand
local player = game.Players.LocalPlayer

while true do
if not walk then
snd.Position = sandpos
break
end
local  chr = player.Character
root = chr:FindFirstChild("HumanoidRootPart")
wait(0.2)
if root then
if root.Position.Z >= endPos.Z then
b.CanCollide = false
else
b.CanCollide = true
end
b.Position =  Vector3.new(-53.5,-29.9,root.Position.Z)
end
end
end, function()
                water.CanTouch = true
                snd.Transparency = 0
                snd.Size -= Vector3.new(0,6,0)
walk = false
end)
add_textbox("Set Water Height", "1~20", snd.Size.Y, function(value)
snd.Size = Vector3.new(snd.Size.X, value, snd.Size.Z)
end)

local noVelocity = false
local velo = 25
add_switch("No Water Velocity", function()
snd.AssemblyLinearVelocity = Vector3.new(0,0,0)
                noVelocity = true
end,
function()
                noVelocity = false
snd.AssemblyLinearVelocity = Vector3.new(0,0,velo)
end)
add_textbox("Set Water Velocity", "Value", velo, function(value) 
                velo = value
if not noVelocity then
                snd.AssemblyLinearVelocity = Vector3.new(0,0,value)
end
end)
-- Quest

local teams = game.Teams:GetChildren()
local playerTeam
for _, team in pairs(teams) do
print(team.Name,team.TeamLeader.Value)
if team.TeamLeader.Value == game.Players.LocalPlayer.Character.Name then
print("found", team.Name)
playerTeam = team.Name
end
end
local dict = {
black = "BlackZone",
blue = "Really blueZone",
green =  "CamoZone",
magenta = "MagentaZone",
red = "Really redZone",
white = "WhiteZone",
yellow = "New YellerZone"
}
function quest(questID)
local q = questID
local plot = dict[playerTeam]
local Event = workspace.QuestMakerEvent

Event:FireServer(
    0
)
task.wait(2)
Event:FireServer(q)
task.wait(3)
local root = game.Players.LocalPlayer.Character.HumanoidRootPart
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
for i=1, 5 do
fireclickdetector(workspace:FindFirstChild(plot).Quest.Butter.PPart.ClickDetector)
wait(3)
end
end
end
add_label("Auto Quests")
add_button("Cloud Quest", function()
                quest(1)
end)
add_button("Target Quest", function() 
                quest(2)
end)
add_button("Ramp Quest", function()
                quest(3)
end)
add_button("Find Me Quest", function()
                quest(4)
end)
-- local player
add_label("Local Player")
local player = game.Players.LocalPlayer
local speed = add_textbox("Walk Speed", "Speed",game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, function(value) 
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
local playerr = game.Players.LocalPlayer.Character
local jump = playerr:WaitForChild("Humanoid").JumpHeight
local jumpheight = add_textbox("Jump Power ", " Value", playerr:WaitForChild("Humanoid").JumpHeight, function(value) 
playerr:WaitForChild("Humanoid").UseJumpPower = false
playerr:WaitForChild("Humanoid").JumpHeight = value
jump = value
end)
local afk
add_switch("Anti AFK", function() 
-- Hook into the VirtualUser and Players service
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Listen for the built-in Idled event
afk = LocalPlayer.Idled:Connect(function()
    -- Simulate a right mouse button press at screen coordinate (0,0)
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    -- Release the simulated click
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

print("Anti-AFK Script Executed successfully!")
end, function()
afk:Disconnect()
end)


game.Players.LocalPlayer.CharacterAdded:Connect(function()
local humanoid =  game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                humanoid.WalkSpeed = speed.Text
      humanoid.JumpHeight = jump
      humanoid.UseJumpPower = false
end)
add_label("Keylss • KILLER2.O")