local whitelist = {
  "falllostgravity",
  "bigbubbly_noob"
}
local prefix = "."
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
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
                end
            end)
        end
    end
end
