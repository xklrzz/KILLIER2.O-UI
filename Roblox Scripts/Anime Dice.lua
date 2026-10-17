loadstring(game:HttpGet("https://vss.pandauth.com/kv/8bacbecbdf57cb59"))()
local cash = game:GetService("ReplicatedStorage").Network.PlotService.RE.CollectBalance
local levelUp = game:GetService("ReplicatedStorage").Network.PlotService.RE.LevelUpSlot
local Roll = game:GetService("ReplicatedStorage").Network.RollService.RF.RollDice
local Rebirth = game:GetService("ReplicatedStorage").Network.RebirthService.RE.Rebirth
local EquipBest = game:GetService("ReplicatedStorage").Network.PlotService.RE.EquipBest
game:GetService("ReplicatedStorage").Network.NotificationService.RE.TextNotification:Destroy()
add_label("--Anime--")
local data = {
		autoCollect = false,
		autoUp = false,
		autoRoll = false
}
local function anime(ver)
		task.spawn(function() 
				while data[ver] do
						if ver == "autoCollect" then
								for i=1, 8 do
								cash:FireServer(i)
								end
						elseif ver == "autoUp" then
								for i = 0, 8 do
task.wait(0.5)
										levelUp:FireServer(i)

								end
								
						elseif ver == "autoRoll" then
								Roll:InvokeServer()
elseif ver == "autoRebirth" then
Rebirth:FireServer()
elseif ver == "autoBest" then
EquipBest:FireServer()
						end
						
						task.wait(1)
				end
		end)
end
		autoCollect = false
add_switch("Auto Collect", function()
data.autoCollect = true
		anime("autoCollect") end, function() data.autoCollect = false end)

add_switch("Auto Anime Upgrade", function()
data.autoUp = true
anime("autoUp")
end, function() data.autoUp = false
end)

add_switch("Auto Dice Roll", function() data.autoRoll = true
		anime("autoRoll") end, function()
				data.autoRoll = false
		end)

add_switch("Auto Rebirth", function() data.autoRebirth  = true
anime("autoRebirth") end, function() data.autoRebirth = false end)

add_switch("Auto Equip Best", function() data.autoBest = true
anime("autoBest") end, function() data.autoBest = false end)

add_label("--Upgrades--")
local upData = {
		autoLuck = false
}
function autoUp(list,typee)
		while upData[typee] do
				task.wait(1)
		for _, item in list do
local upgrade = game:GetService("ReplicatedStorage").Network.RE.BuyUpgrade
upgrade:FireServer(
    item
)
		end
end
end
--[[
local money = {"Money I", "Money II", "Money III","Money IV"}
add_switch("Auto Upgrade Money",function() upData.autoMoney = true 
		autoUp(money, "autoMoney") end, function() upData.autoMoney = false end)]]
-- 1. Money Upgrades
-- ==========================================
-- 1. LISTS DEFINITION (Levels I to XX)
-- ==========================================
local money = {
    "Money I", "Money II", "Money III", "Money IV", "Money V",
    "Money VI", "Money VII", "Money VIII", "Money IX", "Money X",
    "Money XI", "Money XII", "Money XIII", "Money XIV", "Money XV",
    "Money XVI", "Money XVII", "Money XVIII", "Money XIX", "Money XX"
}

local luck = {
    "Luck I", "Luck II", "Luck III", "Luck IV", "Luck V",
    "Luck VI", "Luck VII", "Luck VIII", "Luck IX", "Luck X",
    "Luck XI", "Luck XII", "Luck XIII", "Luck XIV", "Luck XV",
    "Luck XVI", "Luck XVII", "Luck XVIII", "Luck XIX", "Luck XX"
}

local sell = {
    "Sell I", "Sell II", "Sell III", "Sell IV", "Sell V",
    "Sell VI", "Sell VII", "Sell VIII", "Sell IX", "Sell X",
    "Sell XI", "Sell XII", "Sell XIII", "Sell XIV", "Sell XV",
    "Sell XVI", "Sell XVII", "Sell XVIII", "Sell XIX", "Sell XX"
}

local unitStorage = {
    "Unit Storage I", "Unit Storage II", "Unit Storage III", "Unit Storage IV", "Unit Storage V",
    "Unit Storage VI", "Unit Storage VII", "Unit Storage VIII", "Unit Storage IX", "Unit Storage X",
    "Unit Storage XI", "Unit Storage XII", "Unit Storage XIII", "Unit Storage XIV", "Unit Storage XV",
    "Unit Storage XVI", "Unit Storage XVII", "Unit Storage XVIII", "Unit Storage XIX", "Unit Storage XX"
}

local rollSpeed = {
    "Roll Speed I", "Roll Speed II", "Roll Speed III", "Roll Speed IV", "Roll Speed V",
    "Roll Speed VI", "Roll Speed VII", "Roll Speed VIII", "Roll Speed IX", "Roll Speed X",
    "Roll Speed XI", "Roll Speed XII", "Roll Speed XIII", "Roll Speed XIV", "Roll Speed XV",
    "Roll Speed XVI", "Roll Speed XVII", "Roll Speed XVIII", "Roll Speed XIX", "Roll Speed XX"
}

local damage = {
    "Damage I", "Damage II", "Damage III", "Damage IV", "Damage V",
    "Damage VI", "Damage VII", "Damage VIII", "Damage IX", "Damage X",
    "Damage XI", "Damage XII", "Damage XIII", "Damage XIV", "Damage XV",
    "Damage XVI", "Damage XVII", "Damage XVIII", "Damage XIX", "Damage XX"
}

local walkspeed = {
    "Walkspeed I", "Walkspeed II", "Walkspeed III", "Walkspeed IV", "Walkspeed V",
    "Walkspeed VI", "Walkspeed VII", "Walkspeed VIII", "Walkspeed IX", "Walkspeed X",
    "Walkspeed XI", "Walkspeed XII", "Walkspeed XIII", "Walkspeed XIV", "Walkspeed XV",
    "Walkspeed XVI", "Walkspeed XVII", "Walkspeed XVIII", "Walkspeed XIX", "Walkspeed XX"
}


-- ==========================================
-- 2. AUTO UPGRADE SWITCHES
-- ==========================================

add_switch("Auto Upgrade Money", function() 
    upData.autoMoney = true 
    autoUp(money, "autoMoney") 
end, function() 
    upData.autoMoney = false 
end)

add_switch("Auto Upgrade Luck", function() 
    upData.autoLuck = true 
    autoUp(luck, "autoLuck") 
end, function() 
    upData.autoLuck = false 
end)

add_switch("Auto Upgrade Sell", function() 
    upData.autoSell = true 
    autoUp(sell, "autoSell") 
end, function() 
    upData.autoSell = false 
end)

add_switch("Auto Upgrade Unit Storage", function() 
    upData.autoUnitStorage = true 
    autoUp(unitStorage, "autoUnitStorage") 
end, function() 
    upData.autoUnitStorage = false 
end)

add_switch("Auto Upgrade Roll Speed", function() 
    upData.autoRollSpeed = true 
    autoUp(rollSpeed, "autoRollSpeed") 
end, function() 
    upData.autoRollSpeed = false 
end)

add_switch("Auto Upgrade Damage", function() 
    upData.autoDamage = true 
    autoUp(damage, "autoDamage") 
end, function() 
    upData.autoDamage = false 
end)

add_switch("Auto Upgrade Walkspeed", function() 
    upData.autoWalkspeed = true 
    autoUp(walkspeed, "autoWalkspeed") 
end, function() 
    upData.autoWalkspeed = false 
end)