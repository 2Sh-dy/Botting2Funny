local whitelist = {
  "falllostgravity",
  "bigbubbly_noob"
}
local players = game:GetService("Players")
for _,v in pairs(whitelist) do
  for _,p in pairs(players:GetPlayers()) do
    if string.lower(p.Name) == string.lower(v) then
      p.Chatted:Connect(function(msg)
        if msg == "leave" then
          players.LocalPlayer:Kick()
        end
      end)
    end
  end
end
