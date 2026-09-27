local TWS = game:GetService("TweenService")
local B_G = Instance.new("ScreenGui")
B_G.IgnoreGuiInset = true
B_G.Parent = game.CoreGui --game.Players.LocalPlayer.PlayerGui
local f = Instance.new("Frame")
f.Parent = B_G
f.AnchorPoint = Vector2.new(0.5,1)
f.Position = UDim2.new(0.5,0,0,0)
f.Size = UDim2.new(0.4, 0,0.1,0)
f.BackgroundColor3 = Color3.new(1,1,1)
f.BackgroundTransparency = 0.3
f.BorderSizePixel = 0
local TL = Instance.new("TextLabel")
TL.Parent = f
TL.TextScaled = true
TL.BackgroundTransparency = 1
TL.Position = UDim2.new(0.5,0,0.5,0)
TL.AnchorPoint = Vector2.new(0.5,0.5)
TL.Size = UDim2.new(0.5,0,0.8,0)
TL.BorderSizePixel = 1
TL.BorderColor3 = Color3.new(0,0,0)
TL.RichText = true
TL.Text = "<b>Loading Script</b>"
local line = Instance.new("Frame")
line.Parent = f
line.AnchorPoint = Vector2.new(0.5,0.5)
line.Position = UDim2.new(0.05,0,0.9,0)
line.Size = UDim2.new(0,0,0,2)
line.BorderSizePixel = 0
line.BackgroundColor3 = Color3.new(0,0,0)
local loaded = false
local loading = false
TWS:Create(TL, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,-1,true), {TextColor3 = Color3.new(1,1,1)}):Play()

TWS:Create(line, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0.5 ), {BackgroundTransparency = 1, Size = UDim2.new(0,50, 0,2), Position = UDim2.new(0.9, 0, 0.9,0)}):Play()

spawn(function()
		while true do
				if not loaded and not loading then
						loading = true
						TWS:Create(f, TweenInfo.new(0.5), {Position = UDim2.new(0.5,0,0.1,0)}):Play()
				elseif loaded and loading then
						TWS:Create(f, TweenInfo.new(1), {Position = UDim2.new(0.5, 0,-0.1,0)}):Play()
						
						wait(1)
						B_G:Destroy()
				 break
				
				end
		 wait(1)
		end
end)
loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
loaded = true
add_label("xklrzz UI")
add_switch("Auto Tongue ", function()
  task.spawn(function()

  On = true
  while On do
   local Event = game:GetService("ReplicatedStorage").TongueRemotes.TongueEvent
Event:FireServer(
    "start",
    Vector3.new(3169.2653808594, 849.17578125, -523.37359619141)
)
task.wait(2)
   end
end)
  local Tongue = game:GetService("ReplicatedStorage").Events.AddTongue
  while On do
    task.wait(0.01)
    Tongue:FireServer()
  end
end, function() 
  On = false
end)

add_switch("2x Auto Win", function()
  WON = true
  while WON do 
    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
    task.wait(0.01)
    root.CFrame = CFrame.new(math.random(-13195,-13190), 506, -559)
  end
end, function()
  WON = false
end)

add_switch("Auto Rebirth", function()
  ar = true  
  local Event = game:GetService("ReplicatedStorage").Events.RequestRebirth
  while ar do
    Event:InvokeServer()
    task.wait(2)
  end
end, function()
  ar = false
end)
add_button("Remove Invisible Part", function()
 local invispart = workspace.Map.Borders
 for _, part in pair(invispart:GetChildren()) do
  part.Transparency = 0.5
  part.Color = Color3.new(1,0,0)
  task.wait(1)
  part:Destroy()
 end
end)
add_label("About")
add_button("Discord",function()
  setclipboard("https://discord.gg/24YJFmSdgE")
end)