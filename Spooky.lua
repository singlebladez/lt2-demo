queue_on_teleport([[
    repeat
        task.wait()
    until game:IsLoaded()
    print("Nice Cock")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/singlebladez/lt2-demo/main/Spooky'))()
]])

local function CalculateTreeUnits(Tree)
    local Units = 0
    for _, WoodSection in next, Tree:GetChildren() do
        if tostring(WoodSection) == "WoodSection" then
            Units += (WoodSection.Size.X * WoodSection.Size.Y * WoodSection.Size.Z)
        end
    end
    return math.round(math.floor(Units * 100) / 100)
end

local Tree
local unitThreshold = 300

function TPReturner()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
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
                            delfile("NotSameServers.json")
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
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
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

while true do
    Tree = nil

    for i, v in pairs(workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for k, l in pairs(v:GetChildren()) do
                if l:FindFirstChild("TreeClass") and l:FindFirstChild("WoodSection") and l:FindFirstChild("Owner") then
                    if (l.TreeClass.Value == "Spooky" or l.TreeClass.Value == "SpookyNeon") and l.Owner.Value == nil then
                        local treeUnits = CalculateTreeUnits(l)

                        -- Only consider trees that meet the threshold
                        if treeUnits >= unitThreshold then
                            Tree = l
                            break
                        end
                    end
                end
            end
        end
    end

    if Tree == nil then
        game.ReplicatedStorage.Notices.SendUserNotice:Fire("No suitable Spooky Wood found. Hopping to a new server...")
        wait(2)
        Teleport()  -- Call the new Teleport function for server hopping
    else
        local treeUnits = CalculateTreeUnits(Tree)

        if treeUnits >= unitThreshold then
            game.ReplicatedStorage.Notices.SendUserNotice:Fire("Spooky Tree Found with " .. treeUnits .. " units!")

            repeat
                wait()

                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tree["WoodSection"].CFrame
                    game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Tree)
                end

            until Tree["Owner"].Value == game.Players.LocalPlayer

            game.ReplicatedStorage.Notices.SendUserNotice:Fire("Claimed " .. Tree.TreeClass.Value .. " Tree with " .. treeUnits .. " units!")
            break
        else
            game.ReplicatedStorage.Notices.SendUserNotice:Fire("Tree found, but only " .. treeUnits .. " units, hopping...")
            wait(2)
            Teleport()  -- Hop again if tree units are below threshold
        end
    end
end