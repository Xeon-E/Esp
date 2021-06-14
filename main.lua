-- Made by Blissful#4992

local workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

--// Settings:
_G.on = false -- Use this if your making gui

_G.Box_Color = Color3.fromRGB(255, 0, 0)
_G.Box_Thickness = 2
_G.Box_Transparency = 1 -- 1 Visible, 0 Not Visible

local Tracers = false
local Tracer_Color = Color3.fromRGB(255, 0, 0)
local Tracer_Thickness = 2
local Tracer_Transparency = 1 -- 1 Visible, 0 Not Visible

_G.Autothickness = false -- Makes screen less encumbered

_G.Team_Check = false
_G.red = Color3.fromRGB(227, 52, 52)
_G.green = Color3.fromRGB(88, 217, 24)

local function NewLine()
    local line = Drawing.new("Line")
    line.Visible = true
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(1, 1)
    line.Color = _G.Box_Color
    return line
end

local function DrawESP(plr)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine()
    }

    local function Update()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                    for i, v in pairs(lines) do
                        if _G.Autothickness == false then
                            v.Thickness = _G.Box_Thickness
                        end
                        v.Transparency = _G.Box_Transparency
                        if _G.Team_Check == false then
                            v.Color = _G.Box_Color
                        end
                    end
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end
                    if _G.Team_Check then
                        if plr.TeamColor == player.TeamColor then
                            for u, x in pairs(lines) do
                                x.Color = _G.green
                            end
                        else 
                            for u, x in pairs(lines) do
                                x.Color = _G.red
                            end
                        end
                    end
                local pos, vis = camera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    local Scale = plr.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((plr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)
                    
                    for i, v in pairs(lines) do
                        v.Visible = true
                    end
                    
                else
                    for i, v in pairs(lines) do
                        v.Visible = false
                    end
                end    
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= player.Name then
        DrawESP(v)
        end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    DrawESP(v)
end)
