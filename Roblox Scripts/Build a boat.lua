




loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
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
add_switch("Walk on Water", function()
walk = true
		water.Parent = strg
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
wait(0.5)
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
		water.Parent = workspace
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
game.Players.LocalPlayer.CharacterAdded:Connect(function()
local humanoid =  game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		humanoid.WalkSpeed = speed.Text
      humanoid.JumpHeight = jump
      humanoid.UseJumpPower = false
end)