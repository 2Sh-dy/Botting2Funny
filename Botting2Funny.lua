local whitelist = {
    "falllostgravity",
    "bigbubbly_noob"
  }

  local px = "."
  local players = game:GetService("Players")
  local localplayer = players.LocalPlayer
  for _,v in pairs(whitelist) do
      for _,p in pairs(players:GetPlayers()) do
          if string.lower(p.Name) == string.lower(v) then
              p.Chatted:Connect(function(msg)
                  msg = string.split(string.lower(msg), " ")
                  if msg[1] == px.."leave" then
                      players.LocalPlayer:Kick()
                  elseif msg[1] == px.."prefix" then
                      px = msg[2]
                  elseif msg[1] == px.."bring" then
                      localplayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                  elseif msg[1] == px.."say" then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg[2])
                  elseif msg[1] == px.."orbit" then
                    --insert orbit code here
                  end
              end)
          end
      end
  end