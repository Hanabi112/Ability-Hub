if PlaceId == 8357510970 then
end
wait(.1)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Patskorn/GUI/main/Copy-SynapOver.lua"))()

local GUI = library:new("Ability Hub","[ RightControl ]")
local Main = GUI:Tap("Mian")
local Misc = GUI:Tap("Misc")

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

Main:Button("Egg Shop",function()
      local args = {
                [1] = "EGG",
                [2] = workspace.__SETTINGS.__INTERACT.EGG,
                [3] = "3",
                [4] = {}
            }

            game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
end)

Misc:Button("Server Hop",function()
        local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(.1)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end)

Misc:Button("Rejoin",function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").localPlayer)
end)
