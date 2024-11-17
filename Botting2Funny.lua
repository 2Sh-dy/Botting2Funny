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
                if msg == prefix.."leave" then
                    players.LocalPlayer:Kick()
                end
            end)
        end
    end
end
