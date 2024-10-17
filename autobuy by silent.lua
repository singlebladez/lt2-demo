local Client = game:GetService"Players".LocalPlayer

local ShopIDS = {

    ["WoodRUs"] = 7, 
    
    ["CarStore"] = 9, 
    
    ["FurnitureStore"] = 8, 
    
    ["ShackShop"] = 10, 
    
    ["LogicStore"] = 12, 
    
    ["FineArt"] = 11,

}

function FindItem(Item)

    for i, v in next, Workspace.Stores:GetChildren() do

        if tostring(v) == "ShopItems" then

            for i2, v2 in next, v:GetChildren() do

                if v2:FindFirstChild"Owner" and v2.Owner.Value == nil and v2:FindFirstChild"BoxItemName" and v2.BoxItemName.Value == Item then

                    return v2

                end

            end

        end

    end

end

function GetClosestCounter(Item)

    local Counter, Dis = nil, 9e9

    for i, v in next, Workspace.Stores:GetChildren() do

        if tostring(v) ~= "ShopItems" and tostring(v) ~= "LandStore" then

            if (Item.CFrame.p - v.Counter.CFrame.p).Magnitude < Dis then

                Counter, Dis = v.Counter, (Item.CFrame.p - v.Counter.CFrame.p).Magnitude

            end

        end

    end

    return Counter
    
end

function GetItemPrice(Item, Amount)

    for i, v in next, game:GetService"ReplicatedStorage".ClientItemInfo:GetChildren() do

        if tostring(v) == Item then

            if Client.leaderstats.Money.Value >= v.Price.Value * Amount then

                return true

            end
            
        end

    end

end

function PurchaseItem(Item, Amount)

    if not Item or not Amount then

        return warn"Failed"

    end

    if not GetItemPrice(Item, Amount) then

        return warn("Failed - not enough money")

    end

    local OldPos, IsOnCounter = Client.Character.HumanoidRootPart.CFrame, false

    for i = 1, Amount do

        local ItemAdded; ItemAdded = Workspace.PlayerModels.ChildAdded:Connect(function(v)

            local Owner, Main = v:WaitForChild("Owner", 1), v:WaitForChild("Main", 1)

            if Owner and Owner.Value == Client and Main then

                for i2 = 1, 30 do

                    game:GetService"ReplicatedStorage".Interaction.ClientIsDragging:FireServer(v)

                    v:PivotTo(OldPos)

                    game:GetService"ReplicatedStorage".Interaction.ClientIsDragging:FireServer(v)

                    task.wait()
                
                end

                ItemAdded:Disconnect()

                ItemAdded = nil

            end
        
        end)

        local ToPurchase = FindItem(Item)

        if not ToPurchase then

            repeat task.wait()

                ToPurchase = FindItem(Item)

            until ToPurchase

        end

        if (Client.Character.Head.CFrame.p - ToPurchase.Main.CFrame.p).Magnitude >= 20 then

            Client.Character.HumanoidRootPart.CFrame = CFrame.new(ToPurchase.Main.CFrame.p + Vector3.new(5, 1, 5))

        end

        local Counter = GetClosestCounter(ToPurchase.Main)

        local TouchedCounter = ToPurchase.Main.Touched:Connect(function()

            for i, v in next, ToPurchase.Main:GetTouchingParts() do

                if tostring(v) == "Counter" then

                    IsOnCounter = true

                end

            end
        
        end)

        for i3 = 1, 20 do

            if IsOnCounter then

                break

            end

            game:GetService"ReplicatedStorage".Interaction.ClientIsDragging:FireServer(ToPurchase)

            ToPurchase:PivotTo(CFrame.new(Counter.CFrame.p + Vector3.new(0, Counter.Size.Y * ToPurchase.Main.Size.Y / 2, 0)))

            game:GetService"ReplicatedStorage".Interaction.ClientIsDragging:FireServer(ToPurchase)

            task.wait()

        end

        TouchedCounter:Disconnect()

        TouchedCounter = nil

        IsOnCounter = false

        Client.Character.HumanoidRootPart.CFrame = CFrame.new(Counter.CFrame.p + Vector3.new(0, 0, 5))

        repeat task.wait()

            game:GetService"ReplicatedStorage".NPCDialog.PlayerChatted:InvokeServer({ID = ShopIDS[tostring(Counter.Parent)]}, "ConfirmPurchase")

        until tostring(ToPurchase.Parent) ~= "ShopItems"

        repeat task.wait() until not ItemAdded

        print("Bought ", 1, " - ", Amount)

        task.wait(1)

    end

    Client.Character.HumanoidRootPart.CFrame = OldPos + Vector3.new(5, 0, 0)
    
end

PurchaseItem(getgenv().Item, getgenv().Amount)
