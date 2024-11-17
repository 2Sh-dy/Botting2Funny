local whitelist = {
  "falllostgravity",
  "bigbubbly_noob"
}
local prefix = "."
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local orbit
for _,v in pairs(whitelist) do
    for _,p in pairs(players:GetPlayers()) do
        if string.lower(p.Name) == string.lower(v) then
            p.Chatted:Connect(function(msg)
                msg = string.split(string.lower(msg), " ")
                if msg[1] == prefix.."leave" then
                    players.LocalPlayer:Kick()
                elseif msg[1] == prefix.."prefix" then
                    prefix = msg[2]
                elseif msg[1] == prefix.."bring" then
                    localplayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                elseif msg[1] == prefix.."orbit" then
                    task.spawn(function()
                    local origin = p.Character.HumanoidRootPart --a cframe representing the origin of the rotation
                    local r = 10; --radius is commonly represented as a lowercase r in geometrical calculation
                    local rps = math.pi; --abbreviation for radians per second. note that pi radians equals 180 degrees
                    local orbiter = localplayer.Character.HumanoidRootPart --reference to object doing the rotation. should be anchored for decent results

                    local angle = 0; --beginning angle in radians because radians are awesome
                    orbit = game:GetService'RunService'.Heartbeat:Connect(function(dt) --note that dt is short for deltatime, a value representing the time it took since the last frame for this frame to begin
                    	angle = (angle + dt * rps) % (2 * math.pi); --add our rotation per second to our total angle after multiplying it by the deltatime to ensure the addition happens over the course of a second (if we didnt multiply this by the deltatime we would essentially be rotating by pi radians approximately every 30th of a second which is extremely fast). we should also ensure our angle value doesnt exceed 2pi radians (equivalent to 360 degrees) through modulus which isnt necessary but i believe to be good practice nonetheless
                    	orbiter.CFrame = origin.CFrame * CFrame.new(math.cos(angle) * r, 0, math.sin(angle) * r); --set the cframe of the orbiter every frame. our trigonometrical results should be multiplied by our radius to extend the distance according to the value. the way i arranged the trig here causes it to rotate on the y-plane but this can be changed pretty easily.
                    end)
                    end)
                elseif msg[1] == prefix.."unorbit" then
                    orbit:Disconnect()
                end
            end)
        end
    end
end
