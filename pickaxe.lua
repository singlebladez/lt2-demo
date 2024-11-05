-- Available Axe Types:
-- "BasicHatchet", "Axe1", "Axe2", "Axe3", "SilverAxe", "AxeAlphaTesters", 
-- "Rukiryaxe", "AxeBetaTesters", "FireAxe", "SilverAxe", "EndTimesAxe", 
-- "CandyCaneAxe", "Beesaxe", "AxeAmber", "GingerbreadAxe", "AxeTwitter", 
-- "RustyAxe", "CaveAxe", "ManyAxe", "CandyCornAxe"

local selectedItem = "BasicHatchet" -- Set the desired axe type here
local Quantity = 5 -- Set the desired quantity here

local function PickupAxe()
    if Quantity <= 0 then
        return
    end

    local ItemsToTP = {selectedItem}
    local ItemOwner = game:GetService("Players").LocalPlayer.Name
    local OldPos = game:GetService("Players").LocalPlayer.Character.Head.CFrame + Vector3.new(5, 0, 0)

    local function SetVelocity(Model)
        for _, v in pairs(Model:GetChildren()) do
            if v:IsA("BasePart") and (v.Name == "Main" or v.Name == "WoodSection") then
                v.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end

    local itemQty = 0
    for _, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == game:GetService("Players")[ItemOwner] then
            if v:FindFirstChild("ItemName") and table.find(ItemsToTP, v.ItemName.Value) then
                itemQty = itemQty + 1
            end
        end
    end

    if itemQty < Quantity then
        return
    end

    for _, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == game:GetService("Players")[ItemOwner] then
            if v:FindFirstChild("ItemName") and table.find(ItemsToTP, v.ItemName.Value) then
                SetVelocity(v)
                wait(0.1)
                v:SetPrimaryPartCFrame(OldPos)

                for _, v2 in pairs(v:GetChildren()) do
                    if v2:IsA("Part") and v2.Name ~= "Handle" then
                        v2.Velocity = Vector3.new(0, 0, 0)
                    end
                end

                for _, v2 in pairs(v:GetChildren()) do
                    if v2:IsA("Attachment") and v2.Name == "ToolAttachment" then
                        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
                        wait(0.1)
                        v2:Fire()
                        wait(0.1)
                        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
                    end
                end

                Quantity = Quantity - 1
                if Quantity == 0 then
                    break
                end
            end
        end
    end
end

-- Execute function directly (without button)
PickupAxe()
