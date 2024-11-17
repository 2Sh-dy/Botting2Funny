--[[
--prefixes
#plr -- targets plr, can be shortened
all -- targets every player
others -- targets every player excluding command user
unwhitelisted -- targets every player excluding whitelisted users
whitelisted -- targets every whitelisted user
#team -- targets every player in a team
nearest -- targets closest player to command user
farthest -- targets farthest player to command user
#range -- targets everybody within a range

--commands
leave
 • bot gets kicked
bring [plr]
 • bot brings plr to command user
 • if plr is nil, bot will teleport to command user
goto [plr]
 • bot brings command user to plr
 • if plr is nil, bot will bring command user to bot
fling [plr]
 • bot flings plr
 • if plr is nil, command will not run
bounce [plr] [strength]
 • bot teleports under plr and launches them upwards with strength
 • if plr is nil, bot will launch command user
 • to use strength, plr must be defined
orbit [plr] [speed] [range]
 • bot orbits plr with speed and range
 • if plr is nil, bot will orbit command user
 • if speed or range is nil, bot will use defaults
]]
local whitelist = {
  "falllostgravity",
  "bigbubbly_noob",
  "mrtopskyp"
}
local px = "."
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local orbit
local function cmd(p)
    p.Chatted:Connect(function(msg)
        msg = string.split(string.lower(msg), " ")
        if msg[1] == px.."leave" then
            players.LocalPlayer:Kick()
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
                angle = (angle + (dt/5)*((msg[2] or 10)/5) * rps) % (2 * math.pi);
                orbiter.CFrame = CFrame.new(origin.Position) * CFrame.new(math.cos(angle) * r, 0, math.sin(angle) * r); 
            end)
            end)
        elseif msg[1] == px.."unorbit" then
            orbit:Disconnect()
        end
    end)
end
for _,v in pairs(whitelist) do
    for _,p in pairs(players:GetPlayers()) do
        if string.lower(p.Name) == string.lower(v) then
            cmd(p)
        end
    end
end
