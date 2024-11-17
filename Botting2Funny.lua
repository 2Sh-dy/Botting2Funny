local whitelist = {
  "falllostgravity",
  "bigbubbly_noob"
}
local px = "."
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local orbit
for _,v in pairs(whitelist) do
    for _,p in pairs(players:GetPlayers()) do
        if string.lower(p.Name) == string.lower(v) then
            p.Chatted:Connect(function(msg)
                msg = string.split(string.lower(msg), " ")
                if msg[1] == px.."leave" then
                    players.LocalPlayer:Kick()
                elseif msg[1] == px.."px" then
                    px = msg[2]
                elseif msg[1] == px.."bring" then
                    localplayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                elseif msg[1] == px.."orbit" then
                    task.spawn(function()
                    local origin = p.Character.HumanoidRootPart
                    local r = msg[3] or 10
                    local rps = math.pi
                    local orbiter = localplayer.Character.HumanoidRootPart

                    local angle = 0;
                    orbit = game:GetService'RunService'.Heartbeat:Connect(function(dt)
                    	angle = (angle + (dt/5)*(msg[2]/5) * rps) % (2 * math.pi);
                    	orbiter.CFrame = origin.CFrame * CFrame.new(math.cos(angle) * r, 0, math.sin(angle) * r); 
                    end)
                    end)
                elseif msg[1] == px.."unorbit" then
                    orbit:Disconnect()
                end
            end)
        end
    end
end
