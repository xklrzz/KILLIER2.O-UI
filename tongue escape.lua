loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
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
 for _ , part in pairs(invispart:GetChildren()) do
  part.Transparency = 0.7
  part.Color = Color3.new(1,0,0)
  task.wait(0.5)
  part:Destroy()
 end
 invispart:Destroy()
end)
add_label("Support")
add_button("Discord",function()
  setclipboard("https://discord.gg/24YJFmSdgE")
end)
