if PlaceId == 8357510970 then
end
wait(.1)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Patskorn/GUI/main/Copy-SynapOver.lua"))()

local GUI = library:new("Ability Hub","[ RightControl ]")
local Main = GUI:Tap("Mian")

local PlaceId = game.PlaceId
Magnet = true
if PlaceId == 8357510970 then
end
Main:Toggle("Auto Punch",_G.AutoPunch,function(Value)
    AutoPunch = Value
            
     while wait(.1) do
            if AutoPunch then
          game:GetService("ReplicatedStorage").Remotes.TappingEvent:FireServer()
       end
    end
end)

Main:Line()

Main:Toggle("Rebirths (125qd) Energy",nil,function(value)
Rebirths125qd = value
while wait(.1) do
    if Rebirths125qd then
     local args = {
                [1] = "Rebirths",
                [2] = 23
            }

            game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
    end
end
end)
Main:Toggle("Rebirths (300k) Energy",_G.Rebirths300k,function(value)
Rebirths300k = value
while wait(.1) do
    if Rebirths300k then
     local args = {
                [1] = "Rebirths",
                [2] = 11
            }

            game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
    end
end
end)

Main:Line()

Main:Toggle("Auto Egg",_G.AutoEgg,function(VValue)
AutoEgg = VValue

    while wait(.1) do
        if AutoEgg then
                local args = {
                [1] = "EGG",
                [2] = workspace.__SETTINGS.__INTERACT.EGG,
                [3] = "3",
                [4] = {}
            }

            game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
        end
    end
end)
